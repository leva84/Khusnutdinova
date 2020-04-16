class TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end

  def show
    @training = Training.find(params[:id])
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)

    if @training.save
      redirect_to @training
    else
      render 'new'
    end
  end

  private
  def training_params
    params.require(:training).permit(:title, :text)
  end
end
