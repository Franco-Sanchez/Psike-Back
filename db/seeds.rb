# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

p 'Start Create Person'
(1..30).each do
  Person.create(name: Faker::Name.unique.first_name , lastname: Faker::Name.last_name, 
                identity_document: Faker::Number.number(digits: 8), 
                nationality: Faker::Nation.nationality, 
                birthdate: Faker::Date.birthday(min_age: 1, max_age: 100))
end
p 'End Create Person'

people = Person.all

p 'Start Create User'
people.each do |person|
  # (1..2).each do
    User.create(email: "#{Faker::Lorem.unique.word}@gmail.com",
      password: '123456',
      person: person)
  # end
end
p 'End Create User'

users = User.all

p 'Start Create Psychologist'
users.first(12).each do |user|
  # (1..2).each do
    Psychologist.create(biography: Faker::Lorem.paragraph, price: Faker::Number.number(digits: 3),
                      linkedIn: Faker::Internet.domain_name(domain: "linkedIn"), user: user)
  # end
end
p 'End Create Psychologist'

p 'Start Create Patient'
users.last(18).each do |user|
  # (1..3).each do
    Patient.create(user: user)
  # end
end
p 'End Create Patient'

p 'Start Create Specialty'
(1..5).each do
  Specialty.create(name: Faker::Job.unique.field)
end
p 'End Create Specialty'

days = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes"]

p 'Start Create Day'
days.each do |day|
  Day.create(day_name: day, day_number: days.index(day) + 1)
end
p 'End Create Day'

p 'Start Create Hour'
(9..13).each do |hour|
  Hour.create(start_hour: "#{hour}:00", end_hour: "#{hour + 1}:00")
end
p 'End Create Hour'

psychologists = Psychologist.all

p 'Start Create Schedule'
psychologists.each do |psychologist|
  (1..5).each do |id|
    Schedule.create(psychologist: psychologist, day: Day.find(rand(1..5)), hour: Hour.find(id))
  end
end
p 'End Create Schedule'

p 'Start Add Specialty to a Psychologist'
psychologists.each do |psychologist|
  (1..5).each do |id|
    psychologist.specialties << Specialty.find(id)
  end
end
p 'End Add Specialty to a Psychologist'

patients = Patient.all

p 'Start Create Diagnosis'
patients.each do |patient|
  (1..3).each do
    Diagnosis.create(title: Faker::Lorem.word, diagnosis: Faker::Lorem.paragraph, patient: patient)
  end
end
p 'End Create Diagnosis'

p 'Start Create Appointment for Patient'
patients.each do |patient|
  (1..4).each do |id|
    Appointment.create(feedback: Faker::Lorem.paragraph, 
                        day: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
                        reason: Faker::Lorem.paragraph, patient: patient, psychologist: Psychologist.find(id),
                        schedule: Schedule.find(id), diagnosis: Diagnosis.find_by(patient: patient))
  end
end
p 'End Create Appointment for Patient'

appointments = Appointment.all

p 'Start Create Ranking'
appointments.each do |appointment|
  Ranking.create(quantity: rand(1..5), description: Faker::Lorem.paragraph, appointment: appointment)
end
p 'End Create Ranking'

p 'Start Create Comment'
patients.each do |patient|
  Comment.create(description: Faker::Lorem.paragraph, patient: Patient.find(patients.index(patient) + 1),
                  appointment: Appointment.find(patients.index(patient) + 1))
end
p 'End Create Comment'