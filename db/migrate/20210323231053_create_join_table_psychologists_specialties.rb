class CreateJoinTablePsychologistsSpecialties < ActiveRecord::Migration[6.0]
  def change
    create_join_table :psychologists, :specialties do |t|
      # t.index [:psychologist_id, :specialty_id]
      # t.index [:specialty_id, :psychologist_id]
    end
  end
end
