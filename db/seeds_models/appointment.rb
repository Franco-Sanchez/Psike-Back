patients = Patient.all

patients.each do |patient|
  (1..4).each do |id|
    Appointment.create(feedback: Faker::Lorem.paragraph, 
                        day: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
                        reason: Faker::Lorem.paragraph, patient: patient, psychologist: Psychologist.find(id),
                        schedule: Schedule.find(id), diagnosis: Diagnosis.find_by(patient: patient))
  end
end