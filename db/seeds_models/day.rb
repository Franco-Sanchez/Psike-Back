days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

days.each do |day|
  Day.create(day_name: day, day_number: days.index(day) + 1)
end