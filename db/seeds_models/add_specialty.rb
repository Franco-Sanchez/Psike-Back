psychologists = Psychologist.all

psychologists.each do |psychologist|
  (1..5).each do |id|
    psychologist.specialties << Specialty.find(id)
  end
end