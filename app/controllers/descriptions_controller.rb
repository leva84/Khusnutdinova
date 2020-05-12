class DescriptionsController < ApplicationController
  before_action :authorize_admin!
  before_action :set_training

  def create
    @description = @training.descriptions.create(description_params)
    redirect_to training_path(@training)
  end

  def destroy
    @description = @training.descriptions.find(params[:id])
    @description.destroy
    redirect_to training_path(@training)
  end

  private

  def set_training
    @training = Training.find(params[:training_id])
  end

  def description_params
    params.require(:description).permit(:picture, :text, :title)
  end
end
