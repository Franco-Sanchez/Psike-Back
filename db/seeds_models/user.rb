people = Person.all

people.last(5).each do |person|
  User.create(email: "#{Faker::Lorem.unique.word}@gmail.com",
              password: '123456', role: 2, person: person)
end