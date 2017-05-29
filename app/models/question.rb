class Question < ApplicationRecord
  def change_reply_status
    self.reply_status = true
    save!(:validate => false) 
  end
end
