class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :authenticate_admin, only:[:edit, :update, :destroy]
  def index
    @questions = Question.where(reply_status:false || nil).paginate(:page => params[:page], :per_page => 6).order(created_at: "DESC")
    @repliedQuestions = Question.where(reply_status:true).paginate(:page => params[:page], :per_page => 6).order(created_at: "DESC")
  end
  def show
    find_question
  end
  def new
    @question = Question.new
  end
  def create
    question = Question.new(
      :name =>params[:name], 
      :email=>params[:email],
      :body=>params[:body], 
      :phone=>params[:phone], 
      :web=>params[:web],
      :reply_status => 'false')
    if question.save
      flash[:success] = "Question was successfully sent"
      redirect_to :back
    else
      render :new
    end
  end
  def edit
    find_question
  end
  def update
    find_question
        @question.assign_attributes(reply: params[:reply], reply_status: true)
      if @question.save
        @question.change_reply_status
        QuestionMailer.question_reply(@question).deliver_now
        flash[:success] = "Question Replied"
        redirect_to "/questions/#{@question.id}"
      end
  end
  def destroy
    find_question
    if @question.destroy
    flash[:warning] ="Question deleted"
    redirect_to "/questions"
    end
  end

  private
    def find_question
      @question = Question.find_by(id: params[:id]) 
    end
    # def question_params
    #   params.require(:question).permit()
    # end
end
