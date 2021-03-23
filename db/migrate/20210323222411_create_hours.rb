class CreateHours < ActiveRecord::Migration[6.0]
  def change
    create_table :hours do |t|
      t.time :start_hour
      t.time :end_hour

      t.timestamps
    end
  end
end
