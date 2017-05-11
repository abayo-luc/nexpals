class AdminsController < ApplicationController
  def index
    @admin = Admin.all
  end

  def show
    find_admin
  end

  def edit
    @admin = find_admin
  end

  def update
    @admin = find_admin
    if @admin = Admin.update(admin_params)
      flash[:success] = "Info Updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  private
    def find_admin
      @admin = Admin.find_by(id: params[:id])
    end

    def admin_params
      params.require(:admin).permit(:email, :name, :identity)
    end
end
