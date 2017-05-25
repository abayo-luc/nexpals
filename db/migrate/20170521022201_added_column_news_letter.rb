class AddedColumnNewsLetter < ActiveRecord::Migration[5.0]
  def change
    add_column :news_letters, :confirm_token, :string
  end
end
