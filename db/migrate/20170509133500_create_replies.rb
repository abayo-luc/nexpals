class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.integer :comment_id
      t.text :body
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
