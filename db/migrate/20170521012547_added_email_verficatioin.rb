class AddedEmailVerficatioin < ActiveRecord::Migration[5.0]
  def change
    add_column :news_letters, :email_confirmed, :boolean, :default => false
  end
end
