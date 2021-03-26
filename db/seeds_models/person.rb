(1..30).each do
  Person.create(name: Faker::Name.unique.first_name , lastname: Faker::Name.last_name, 
                identity_document: Faker::Number.number(digits: 8), 
                nationality: Faker::Nation.nationality, 
                birthdate: Faker::Date.birthday(min_age: 1, max_age: 100),
                avatar: { io: File.open('db/seeds_images/avatar_default.jpg'), filename: 'avatar.jpg'})
end