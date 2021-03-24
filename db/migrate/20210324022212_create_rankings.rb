class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.integer :quantity
      t.text :description
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
