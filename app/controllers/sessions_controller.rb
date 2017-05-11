class SessionsController < ApplicationController

  def new
    
  end

  def create
    usern = Admin.find_by(email :params[:email])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      flash[:success] = "logged in!"
      redirect_to root_path
    else 
      flash[:warning] = "You don't belong here!"
      redirect_to "/admin"
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:info] = "Thank you for contributing, See you soon!"
    redirect_to "/admin"
  end
end
