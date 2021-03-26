class CreateTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :transfers do |t|
      t.date :day
      t.integer :amount
      t.string :code

      t.timestamps
    end
  end
end
