class AddCategoryColumnToSpecialties < ActiveRecord::Migration[6.0]
  def change
    add_column :specialties, :category, :integer
  end
end
