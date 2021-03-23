class CreatePsychologists < ActiveRecord::Migration[6.0]
  def change
    create_table :psychologists do |t|
      t.text :biography
      t.string :linkedIn
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
