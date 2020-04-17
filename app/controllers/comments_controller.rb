class CommentsController < ApplicationController

  def create
    @training = Training.find(params[:training_id])
    @comment = @training.comments.create(comment_params)
    redirect_to training_path(@training)
  end

  def destroy
    @training = Training.find(params[:training_id])
    @comment = @training.comments.find(params[:id])
    @comment.destroy
    redirect_to training_path(@training)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
