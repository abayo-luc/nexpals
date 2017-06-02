class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin
  def news_letter
    news_letter = NewsLetter.new
  end
  helper_method :news_letter_new

  def authenticate_admin
    unless current_admin 
      flash[:danger] = "Access Denied"
      redirect_to "/"
    end
  end
end