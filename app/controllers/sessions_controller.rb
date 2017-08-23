class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) 
      session[:user_id] = user.id
      flash[:success] = "logged in!"
      redirect_to main_app.root_path
    else 
      flash[:warning] = "You don't belong here!"
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:info] = "Thank you for contributing, See you soon!"
    redirect_to "/admin"
  end
end
