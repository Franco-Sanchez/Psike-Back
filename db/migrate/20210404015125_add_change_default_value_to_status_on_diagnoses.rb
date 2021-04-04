class AddChangeDefaultValueToStatusOnDiagnoses < ActiveRecord::Migration[6.0]
  def change
    change_column_default :diagnoses, :status, from: false, to: true
  end
end
