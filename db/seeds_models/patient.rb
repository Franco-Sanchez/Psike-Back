users = User.all

users.last(18).each do |user|
  Patient.create(user: user)
end