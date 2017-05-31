class QuestionMailer < ApplicationMailer
  default :from => "nexpals250@gmail.com"
  def question_reply(question)
    @question = question
    mail to: @question.email, subject: "Question Reply"
  end
end
