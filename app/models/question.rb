class Question < ApplicationRecord
  validates :name, :email, :phone, presence: true 
  validates :body, length: {minimum: 10}

  def change_reply_status
    self.reply_status = true
    save!(:validate => false) 
  end
end
