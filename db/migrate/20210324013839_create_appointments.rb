class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.text :feedback
      t.integer :status
      t.date :day
      t.text :reason
      t.references :schedule, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.references :psychologist, null: false, foreign_key: true
      t.references :diagnosis, null: false, foreign_key: true

      t.timestamps
    end
  end
end
