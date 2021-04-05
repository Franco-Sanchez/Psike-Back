(1..5).each do
  Person.create(name: Faker::Name.unique.first_name , lastname: Faker::Name.last_name, 
                identity_document: Faker::Number.number(digits: 8), 
                nationality: Faker::Nation.nationality, 
                birthdate: Faker::Date.birthday(min_age: 1, max_age: 100),
                avatar: { io: File.open('db/seeds_images/avatar_default.jpg'), filename: 'avatar.jpg' })
end

Person.create(name:"Ana Lucia", lastname:"Pérez de Velasco Geldres", identity_document: Faker::Number.number(digits: 8),nationality:"Peru", birthdate:"25-01-1994",avatar: { io: File.open('db/seeds_images/p_1.jpg'), filename: 'p_1.jpg' })
Person.create(name:"Valeria", lastname:"Naito", identity_document: Faker::Number.number(digits: 8),nationality:"Peru", birthdate:"15-05-1992",avatar: { io: File.open('db/seeds_images/p_2.jpg'), filename: 'p_2.jpg' })
Person.create(name:"Alberto", lastname:"Pacheco Araoz", identity_document: Faker::Number.number(digits: 8),nationality:"Peru", birthdate:"25-12-1990",avatar: { io: File.open('db/seeds_images/p_3.jpg'), filename: 'p_3.jpg' })
Person.create(name:"Daniela", lastname:"del Carpio Carrizales", identity_document: Faker::Number.number(digits: 8),nationality:"Peru", birthdate:"25-01-1994",avatar: { io: File.open('db/seeds_images/p_4.jpg'), filename: 'p_4.jpg' })
Person.create(name:"Rafael", lastname:"Aramburú Umbert", identity_document: Faker::Number.number(digits: 8),nationality:"Peru", birthdate:"25-01-1994",avatar: { io: File.open('db/seeds_images/p_5.jpg'), filename: 'p_5.jpg' })
Person.create(name:"Andrea", lastname:"Bonilla", identity_document: Faker::Number.number(digits: 8),nationality:"Peru", birthdate:"25-01-1994",avatar: { io: File.open('db/seeds_images/p_6.jpg'), filename: 'p_6.jpg' })
Person.create(name:"Michel", lastname:"Pérez Ozores", identity_document: Faker::Number.number(digits: 8),nationality:"Peru", birthdate:"25-01-1994",avatar: { io: File.open('db/seeds_images/p_7.jpg'), filename: 'p_7.jpg' })
Person.create(name:"Luciana", lastname:"Garcia Castro", identity_document: Faker::Number.number(digits: 8),nationality:"Peru", birthdate:"25-01-1994",avatar: { io: File.open('db/seeds_images/p_8.jpg'), filename: 'p_8.jpg' })
Person.create(name:"Jeancarlo Joel", lastname:"Bolaños Rueda", identity_document: Faker::Number.number(digits: 8),nationality:"Peru", birthdate:"25-01-1994",avatar: { io: File.open('db/seeds_images/p_9.jpg'), filename: 'p_9.jpg' })