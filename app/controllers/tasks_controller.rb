class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
    @task.comments.build(user_id: current_user.id)  # Initialize comment with current user's ID
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      @task.user_ids = params[:task][:user_ids] if params[:task][:user_ids].present? # Assign multiple users

      flash[:alert] = 'Task was successfully saved.'
      redirect_to @task
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
    if @task.nil?
      redirect_to tasks_path, alert: "Task not found."
    else
      @comments = @task.comments
    end
  end

  def edit
    @task = Task.find(params[:id])
    @task.comments.build(user_id: current_user.id) if @task.comments.empty?  # Initialize comment if none exist
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

  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    redirect_to @task
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date, user_ids: [], comments_attributes: [:id, :content, :user_id, :_destroy])
  end
end
