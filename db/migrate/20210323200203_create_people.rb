class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :lastname
      t.integer :identity_document
      t.string :nationality
      t.date :birthdate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
