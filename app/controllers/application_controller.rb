class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
        :account_update,
        keys: [:password, :password_confirmation, :current_password]
    )
  end

  def authorize_admin!
    redirect_to root_path, alert: 'Шалунишка! :)' unless current_user.is_admin
  end
end
