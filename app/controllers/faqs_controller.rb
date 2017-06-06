class FaqsController < ApplicationController
  def index
    @faqs = Faq.all
  end

  def show
    find_faq
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      flash[:success] = "FAQ creared"
      redirect_to :back
    else
      render :new
    end
  end

  def edit
    find_faq
  end

  def update
    find_faq
    if @faq.update(faq_params)
      flash[:success] = "FAQ updated"
      redirect_to :back
    else
      render :edit
    end
  end

  def destroy
    find_faq
    if @faq.destroy
      flash[:warning] = "FAQ deleted"
      redirect_to :back
    else

    end
  end

  private 
    def find_faq
      @faq = Faq.find_by(id: params[:id])
    end

    def faq_params
      params.require(:faq).permit(:question, :answer)
    end

    def check_for_cancel
      if params[:commit] = 'cancel'
        redirect_back_or_default
      end
      
    end

end
