patients = Patient.all

patients.each do |patient|
  (1..3).each do
    Diagnosis.create(title: Faker::Lorem.word, diagnosis: Faker::Lorem.paragraph, patient: patient)
  end
end