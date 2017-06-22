class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_admin
    if current_user && current_user.admin
      current_admin = current_user
    end
  end
  helper_method :current_admin
  
  def news_letter
    news_letter = NewsLetter.new
  end
  helper_method :news_letter_new

  def authenticate_admin
    unless current_user && current_user.admin 
      flash[:danger] = "Access Denied"
      redirect_to "/"
    end
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end