class AddPatientToDiagnoses < ActiveRecord::Migration[6.0]
  def change
    add_reference :diagnoses, :patient, null: false, foreign_key: true
  end
end
