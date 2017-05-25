class NewsLetterMailer < ApplicationMailer
  default :from => "nexpals250@gmail.com"

  def email_confirmation(subscription)
    @subscription = subscription

    mail to: subscription.email , subject: "Email Confimration"
  end
end
