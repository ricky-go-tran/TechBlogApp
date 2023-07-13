class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    added_attrs = [:fullname, :username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end
  def user_not_authorized
    redirect_to not_permission_articles_path
  end
end
