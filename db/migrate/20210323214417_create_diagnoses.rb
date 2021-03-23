class CreateDiagnoses < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnoses do |t|
      t.string :title
      t.text :diagnosis
      t.boolean :status

      t.timestamps
    end
  end
end
