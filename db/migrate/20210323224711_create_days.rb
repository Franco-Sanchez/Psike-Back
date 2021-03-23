class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string :day_name
      t.integer :day_number

      t.timestamps
    end
  end
end
