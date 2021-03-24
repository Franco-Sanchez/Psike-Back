# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

p 'Start Create Person'
(1..18).each do
  Person.create(name: Faker::Name.first_name , lastname: Faker::Name.last_name, 
                identity_document: Faker::Number.number(digits: 8), 
                nationality: Faker::Nation.nationality, 
                birthdate: Faker::Date.birthday(min_age: 1, max_age: 100))
end
p 'End Create Person'

p 'Start Create User'
(1..18).each do |id|
  User.create(email: "#{Faker::Lorem.unique.word}@gmail.com",
              password: Faker::Internet.password(min_length: 6),
              person: Person.find(id))
end
p 'End Create User'

p 'Start Create Psychologist'
(1..8).each do |id|
  Psychologist.create(biography: Faker::Lorem.paragraph, price: Faker::Number.number(digits: 3),
                      linkedIn: Faker::Internet.domain_name(domain: "linkedIn"), user: User.find(id))
end
p 'End Create Psychologist'

p 'Start Create Patient'
(9..18).each do |id|
  Patient.create(user: User.find(id))
end
p 'End Create Patient'