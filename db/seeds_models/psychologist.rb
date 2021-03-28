users = User.all

users.last(5).each do |user|
  Psychologist.create(biography: Faker::Lorem.paragraph, price: rand(50..120),
                      linkedIn: Faker::Internet.domain_name(domain: "linkedIn"), user: user)
end