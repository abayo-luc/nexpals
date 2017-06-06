class AddPhotoToMember < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :photo, :string
  end
end
