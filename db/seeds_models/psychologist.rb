users = User.all

users.first(12).each do |user|
  Psychologist.create(biography: Faker::Lorem.paragraph, price: rand(50..120),
                      linkedIn: Faker::Internet.domain_name(domain: "linkedIn"), user: user)
end