people = Person.all

people.last(9).each do |person|
  User.create(email: "#{person.name}@gmail.com",
              password: '123456', role: 2, person: person)
end