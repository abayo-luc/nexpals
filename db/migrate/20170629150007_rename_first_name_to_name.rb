class RenameFirstNameToName < ActiveRecord::Migration[5.0]
  def change
    rename_column :members, :first_name, :name
  end
end
