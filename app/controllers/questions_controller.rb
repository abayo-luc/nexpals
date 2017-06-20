class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  def index
    @questions = Question.all
  end
  def show
    find_question
  end
  def new
    @question = Question.new
  end
  def create
    question = Question.new(question_params)
    if question.save
      flash[:success] = "Question was successfully sent"
      redirect_to "/"
    else
      render :new
    end
  end
  def edit
    find_question
  end
  def update
    find_question
      if @question.update(question_params)
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
    def question_params
      params.require(:question).permit(:name, :email, :body, :phone, :web, :subject, :reply)
    end
end
