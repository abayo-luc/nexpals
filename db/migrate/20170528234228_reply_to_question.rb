class ReplyToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :reply, :text
    add_column :questions, :reply_status, :boolean 
  end
end
