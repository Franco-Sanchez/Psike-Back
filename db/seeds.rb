require 'faker'
# require_relative './variables.rb'

p 'Start Create Person'
(1..5).each do
Person.create(name: Faker::Name.unique.first_name , lastname: Faker::Name.last_name, 
              identity_document: Faker::Number.number(digits: 8), 
              nationality: Faker::Nation.nationality, 
              birthdate: Faker::Date.birthday(min_age: 1, max_age: 100),
              avatar: { io: File.open('db/seeds_images/avatar_default.jpg'), filename: 'avatar.jpg'})
end
p 'End Create Person'

p 'Start Create User'
people = Person.all

people.each do |person|
  User.create(email: "#{Faker::Lorem.unique.word}@gmail.com",
              password: '123456', person: person)
end
p 'End Create User'

# p 'Start Create Psychologist'
# require_relative './seeds_models/psychologist.rb'
# p 'End Create Psychologist'

# p 'Start Create Patient'
# require_relative './seeds_models/patient.rb'
# p 'End Create Patient'

# p 'Start Create Specialty and Subspecialties'
# require_relative './seeds_models/specialty.rb'
# p 'End Create Specialty'

# p 'Start Create Day'
# require_relative './seeds_models/day.rb'
# p 'End Create Day'

# p 'Start Create Hour'
# require_relative './seeds_models/hour.rb'
# p 'End Create Hour'

# p 'Start Create Schedule'
# require_relative './seeds_models/schedule.rb'
# p 'End Create Schedule'

# p 'Start Add Specialty to a Psychologist'
# require_relative './seeds_models/add_specialty.rb'
# p 'End Add Specialty to a Psychologist'

# p 'Start Create Diagnosis'
# require_relative './seeds_models/diagnosis.rb'
# p 'End Create Diagnosis'

# p 'Start Create Appointment for Patient'
# require_relative './seeds_models/appointment.rb'
# p 'End Create Appointment for Patient'

# p 'Start Create Ranking'
# require_relative './seeds_models/ranking.rb'
# p 'End Create Ranking'

# p 'Start Create Comment'
# require_relative './seeds_models/comment.rb'
# p 'End Create Comment'