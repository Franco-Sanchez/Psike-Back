class AddColumnToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :url, :string
  end
end
