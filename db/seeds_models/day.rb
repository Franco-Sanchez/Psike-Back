days = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes"]

days.each do |day|
  Day.create(day_name: day, day_number: days.index(day) + 1)
end