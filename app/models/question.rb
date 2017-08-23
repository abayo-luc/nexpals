class Question < ApplicationRecord
  # validates :name, :email, :phone, presence: true 
  # validates :body

  def change_reply_status
    self.reply_status = true
    save!(:validate => false) 
  end
end
