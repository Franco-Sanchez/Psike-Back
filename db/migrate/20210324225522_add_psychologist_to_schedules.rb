class AddPsychologistToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedules, :psychologist, null: false, foreign_key: true
  end
end
