class AddDefaultValueToStatusOnDiagnoses < ActiveRecord::Migration[6.0]
  def change
    change_column_default :diagnoses, :status, from: nil, to: false
  end
end
