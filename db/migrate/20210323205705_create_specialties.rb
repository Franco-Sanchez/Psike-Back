class CreateSpecialties < ActiveRecord::Migration[6.0]
  def change
    create_table :specialties do |t|
      t.string :name
      t.boolean :status, default: false
      t.references :parent, index: true

      t.timestamps
    end
  end
end
