class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    user_attrs = [
      :name, :nick_name, :icon, :icon_cache,
    ]
    devise_parameter_sanitizer.permit(:sign_up, keys: user_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: user_attrs)
  end
end
