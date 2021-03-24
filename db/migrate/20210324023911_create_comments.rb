class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :description
      t.references :patient, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.references :message, foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
