# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Start Create Person
7.times do
  Person.create(name: Faker::Name.first_name , lastname: Faker::Name.last_name, 
                identity_document: Faker::Number.number(digits: 8), 
                nationality: Faker::Nation.nationality, 
                birthdate: Faker::Date.birthday(min_age: 1, max_age: 100))
end
# End Create Person

# Start Create User
7.times do |id|
  User.create(email: "#{Faker::Internet.unique.username}@gmail.com",
              password: Faker::Internet.password(min_length: 6),
              person: Person.find(id))
end
# End Create User

# Start Create Psychologist
2.times do |id|
  Psychologist.create(biography: Faker::Lorem.paragraph, price: Faker::Number.number(digits: 3),
                      linkedInd: Faker::Internet.domain_name(domain: "linkedIn"), user: User.find(id))
end
# End Create Psychologist

# Start Create Patient
initial_id = 2

5.times do |i|
  Patient.create(user: User.find(initial_id + i))
end
# End Create Patient