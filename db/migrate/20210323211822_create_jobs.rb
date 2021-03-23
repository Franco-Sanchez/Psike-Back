class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :position
      t.string :enterprise
      t.references :psychologist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
