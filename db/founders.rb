founders = [
  { name: 'Diego', lastname: 'Puma', identity_document: 12345678, nationality: 'Peruvian', birthdate: '28-11-1999', avatar: { io: File.open('db/seeds_images/avatar_default.jpg'), filename: 'avatar.jpg'}  },
  { name: 'Grecia', lastname: 'Delgado', identity_document: 12345678, nationality: 'Peruvian', birthdate: '25-08-1996', avatar: { io: File.open('db/seeds_images/avatar_default.jpg'), filename: 'avatar.jpg'} },
  { name: 'Carlos', lastname: 'Juárez', identity_document: 12345678, nationality: 'Peruvian', birthdate: '01-05-1995', avatar: { io: File.open('db/seeds_images/avatar_default.jpg'), filename: 'avatar.jpg'} },
  { name: 'Franco', lastname: 'Sánchez', identity_document: 12345678, nationality: 'Peruvian', birthdate: '10-09-1998', avatar: { io: File.open('db/seeds_images/avatar_default.jpg'), filename: 'avatar.jpg'} }
]

founders.each { |founder| Person.create(founder) }

Person.all.last(4).each do |person| 
  User.create(email: "#{person.name.downcase}@gmail.com", password: '123456', role: 1, person: person)
end

User.all.last(4).each { |user| Patient.create(user: user) }