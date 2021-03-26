psychologists = Psychologist.all

psychologists.each do |psychologist|
  (1..5).each do |id|
    Schedule.create(psychologist: psychologist, day: Day.find(rand(1..5)), hour: Hour.find(id))
  end
end