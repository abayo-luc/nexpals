class QuestionsController < ApplicationController
  def questions
    @questions = Question.all
  end
  def show
    find_question
  end
  def new
    @question = Question.new
  end
  def create
    question = Question.new(quesiton_params)
    if question.save
      flash[:success] = "Question was successfully sent"
    end
  end
  def edit
    find_question
  end
  def update
    find_question
      if @question.update(quesiton_params)
        flash[:success] = "Question edited"
      end
  end
  def destroy
    find_question
    if @question.destroy
    flash[:warning] ="Question deleted"
    end
  end

  private
    def find_question
      @question = Question.find_by(id: params[:id]) 
    end
    def quesiton_params
      params.require(:question).permit(:name, :email, :body, :phone, :web)
    end
end
