class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.text :short_bio
      t.string :phone
      t.string :email
      t.string :location
      t.string :photo

      t.timestamps
    end
  end
end
