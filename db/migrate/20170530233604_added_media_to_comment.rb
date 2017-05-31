class AddedMediaToComment < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :media, :string
  end
end
