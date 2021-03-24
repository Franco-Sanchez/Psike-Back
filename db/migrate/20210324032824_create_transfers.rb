class CreateTransfers < ActiveRecord::Migration[6.0]
  def change
    create_table :transfers do |t|
      t.date :day
      t.integer :amount
      t.string :code
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
