# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

p 'Start Create Person'
(1..5).each do
  Person.create(name: Faker::Name.first_name , lastname: Faker::Name.last_name, 
                identity_document: Faker::Number.number(digits: 8), 
                nationality: Faker::Nation.nationality, 
                birthdate: Faker::Date.birthday(min_age: 1, max_age: 100))
end
p 'End Create Person'

people = Person.all

p 'Start Create User'
people.each do |person|
  (1..2).each do
    User.create(email: "#{Faker::Lorem.unique.word}@gmail.com",
      password: '123456',
      person: person)
  end
end
p 'End Create User'

users = User.all

p 'Start Create Psychologist'
users.first(5).each do |user|
  (1..2).each do
    Psychologist.create(biography: Faker::Lorem.paragraph, price: Faker::Number.number(digits: 3),
                      linkedIn: Faker::Internet.domain_name(domain: "linkedIn"), user: user)
  end
end
p 'End Create Psychologist'

p 'Start Create Patient'
users.last(5).each do |user|
  (1..3).each do
    Patient.create(user: user)
  end
end
p 'End Create Patient'

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
  (1..3).each do |id|
    Schedule.create(psychologist: psychologist, day: Day.find(id), hour: Hour.find(id))
  end
end
p 'End Create Schedule'

patients = Patient.all

p 'Start Create Diagnosis'
patients.each do |patient|
  (1..3).each do
    Diagnosis.create(title: Faker::Lorem.word, diagnosis: Faker::Lorem.paragraph, patient: patient)
  end
end
p 'End Create Diagnosis'

p 'Start Create Appointment'
patients.each do |patient|
  (1..3).each do |id|
    Appointment.create(feedback: Faker::Lorem.paragraph, 
                        day: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
                        reason: Faker::Lorem.paragraph, patient: patient, psychologist: Psychologist.find(id),
                        schedule: Schedule.find(id), diagnosis: Diagnosis.find(id))
  end
end
p 'End Create Appointment'