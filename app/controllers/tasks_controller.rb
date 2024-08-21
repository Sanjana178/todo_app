class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user

    if @task.save
      flash[:alert] = 'Task was successfully saved.'
      redirect_to @task
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:alert] = 'Task was successfully updated.'
      redirect_to @task
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date)
  end
end
