class AddTypeColumnToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :type, :integer
  end
end
