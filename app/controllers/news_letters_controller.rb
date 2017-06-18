class NewsLettersController < ApplicationController
  # before_create :confirmation_token
  def new
    @news_letter = NewsLetter.new
  end
  def create
    @subscription = NewsLetter.new(email: params[:email])
    @record = NewsLetter.find_by_email(@subscription.email)
    if !@record
    if @subscription.save
      NewsLetterMailer.email_confirmation(@subscription).deliver
      flash[:success] = "Please confirm your email address to continue"
      redirect_to :back
    else
      flash[:warnning] = "Ooooppss, something went wrong!"
      redirect_to :back
    end
    elsif @record && !@record.email_confirmed
      @subscription = @record
      NewsLetterMailer.email_confirmation(@subscription).deliver
      flash[:success] = "Please confirm your email address to continue"
      redirect_to "/"
    end
  end

  def confirm_email
      subscription = NewsLetter.find_by_confirm_token(params[:id])
      if subscription
        subscription.email_activate
        flash[:success] = "Welcome NexPals! Your email has been confirmed"
        redirect_to "/"
      else
        flash[:error] = "Sorry. User does not exist"
        redirect_to "/"
      end
  end

end
