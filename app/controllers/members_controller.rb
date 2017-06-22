class MembersController < ApplicationController
  before_action :authenticate_admin, except: [:index]
   wrap_parameters :member

  def index
    @members = Member.all
  end
  def show
    find_member
  end
  def new
    @member = Member.new
  end
  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:sucess] = "Member Added"
      redirect_to @member
    else
      render :new
    end
  end
  def edit
    find_member
  end
  def update
    find_member
    if @member.update(member_params)
      flash[:sucess] = "Member Updated"
      redirect_to @member
    else
      render :edit
    end
  end
  def destroy
    find_member
    if @emember.destroy
      flash[:danger] = "Member Removed"
      redirect_to "/members"
    else
    end
  end

  private
    def find_member
      @member = Member.find_by(id: params[:id])
    end
    def member_params
      params.require(:member).permit(:first_name, :last_name, :phone, :title, :email, :short_bio, :location, :photo)
    end
end
