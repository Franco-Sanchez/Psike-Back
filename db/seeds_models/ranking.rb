appointments = Appointment.all

appointments.each do |appointment|
  Ranking.create(quantity: rand(1..5), description: Faker::Lorem.paragraph, appointment: appointment)
end