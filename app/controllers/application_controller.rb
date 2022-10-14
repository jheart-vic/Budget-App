class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :user_params
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :password, :current_password) }
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_me)
  end
end
