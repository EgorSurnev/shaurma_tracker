class ApplicationController < ActionController::Base
  # Разрешаем дополнительные параметры для Devise (из main)
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    # Добавляем nickname при регистрации (из main)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
  
  # Ваш код для отдельного layout на страницах авторизации
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