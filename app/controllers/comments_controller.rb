class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task


  def create
    @comment = @task.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      puts "Comment saved successfully!"
      redirect_to @task, notice: 'Comment was successfully created.'
    else
      puts "Failed to save comment: #{@comment.errors.full_messages}"
      redirect_to @task, alert: 'Unable to add comment. Please try again.'
    end
  end

  def destroy
    @comment = @task.comments.find(params[:id])
    @comment.destroy
    redirect_to @task, notice: 'Comment was successfully deleted.'
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
