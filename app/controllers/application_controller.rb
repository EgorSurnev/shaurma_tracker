class ApplicationController < ActionController::Base
  # Разрешаем дополнительные параметры для Devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    # Добавляем nickname при регистрации
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
  
  # Отдельный layout для страниц авторизации
  layout :layout_by_resource
  
  private
  
  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end