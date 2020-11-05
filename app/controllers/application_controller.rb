class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :profile_picture])
    devise_parameter_sanitizer.permit(:edit, keys: [:username, :first_name, :last_name, :profile_picture])
  end
end
