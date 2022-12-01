class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to project_ticket_path(params[:project_id], params[:ticket_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :ticket_id)
  end
end
