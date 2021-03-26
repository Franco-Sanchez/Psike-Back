(9..13).each do |hour|
  Hour.create(start_hour: "#{hour}:00", end_hour: "#{hour + 1}:00")
end