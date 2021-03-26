class AddCategoryColumnToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :category, :integer
  end
end
