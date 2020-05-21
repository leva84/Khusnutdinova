class TrainingsController < ApplicationController
  before_action :authorize_admin!, except: [:index, :show]
  before_action :set_training, only: [:show, :edit, :edit, :destroy]

  def index
    @trainings = Training.all
  end

  def show
    @user = current_user
    @training_subscription_user = @training.training_subscriptions.find_by(user_id: @user.id) if @user.present?
  end

  def new
    @training = Training.new
  end

  def edit

  end

  def create
    @training = Training.new(training_params)

    if @training.save
      redirect_to @training
    else
      render 'new'
    end
  end

  def update
    if @training.update(training_params)
      redirect_to @training
    else
      render 'edit'
    end
  end

  def destroy
    @training.destroy

    redirect_to trainings_path
  end

  private

  def set_training
    @training = Training.find(params[:id])
  end

  def training_params
    params.require(:training).permit(:title, :text, :cover, :address, :start_time, :finish_time, :cost)
  end
end
