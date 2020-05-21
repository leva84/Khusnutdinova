class TrainingSubscriptionsController < ApplicationController
  before_action :set_training_subscription, only: [:destroy]
  before_action :set_training, only: %i[create destroy]

  # POST /training_subscriptions
  def create
    @training_subscription = TrainingSubscription.new(training_subscription_params)
    @training_subscription.user = current_user
    @training_subscription.training = @training

    if @training_subscription.save
      redirect_to @training, notice: 'Вы успешно подписались на тренинг'
    else
      redirect_to @training, notice: 'Наверняка вы уже подписаны'
    end
  end

  # DELETE /training_subscriptions/1
  def destroy
    if @training_subscription.user == current_user
      @training_subscription.destroy
      redirect_to @training, notice: 'Вы успешно отменили подписку на тренинг'
    else
      redirect_to @training, notice: 'Вы не можете отменить чужую подписку'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_training_subscription
    @training_subscription = TrainingSubscription.find(params[:id])
  end

  def set_training
    @training = Training.find(params[:training_id])
  end

  # Only allow a list of trusted parameters through.
  def training_subscription_params
    params.fetch(:training_subscription, {}).permit(:user_email, :user_name)
  end
end
