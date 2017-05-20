class AddedSubjectColum < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :subject, :string
  end
end
