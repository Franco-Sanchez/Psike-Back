class AddTypeColumnToSpecialties < ActiveRecord::Migration[6.0]
  def change
    add_column :specialties, :type, :integer
  end
end
