patients = Patient.all

patients.each do |patient|
  Comment.create(description: Faker::Lorem.paragraph, patient: Patient.find(patients.index(patient) + 1),
                  appointment: Appointment.find(patients.index(patient) + 1), category: 0)
end