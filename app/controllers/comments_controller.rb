class CommentsController < ApplicationController
  before_action :authorize_admin!, except: [:create]
  before_action :set_training

  def create
    @comment = @training.comments.create(comment_params)
    redirect_to training_path(@training)
  end

  def destroy
    @comment = @training.comments.find(params[:id])
    @comment.destroy
    redirect_to training_path(@training)
  end

  private

  def set_training
    @training = Training.find(params[:training_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
