class AddCategoryToStudentsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :category_id, :integer
  end
end
