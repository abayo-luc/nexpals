# Preview all emails at http://localhost:3000/rails/mailers/news_letter_mailer
class NewsLetterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/news_letter_mailer/email_confirmation
  def email_confirmation
    NewsLetterMailer.email_confirmation
  end

end
