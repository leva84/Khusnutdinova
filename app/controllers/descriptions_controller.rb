class DescriptionsController < ApplicationController
  #before_action :set_description, only: [:destroy]

  def create
    @training = Training.find(params[:training_id])
    @description = @training.descriptions.create(description_params)
    redirect_to training_path(@training)
  end

  def destroy
    @training = Training.find(params[:training_id])
    @description = @training.descriptions.find(params[:id])
    @description.destroy
    redirect_to training_path(@training)
  end

  private

  def description_params
    params.require(:description).permit(:picture, :text, :title)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_description
    @description = Description.find(params[:id])
  end
end
