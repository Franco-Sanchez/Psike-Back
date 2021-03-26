people = Person.all

people.each do |person|
  User.create(email: "#{Faker::Lorem.unique.word}@gmail.com",
              password: '123456', person: person)
end