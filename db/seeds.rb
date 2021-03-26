require 'faker'
require_relative './variables.rb'

p 'Start Create Person'
require_relative './seeds_models/person.rb'
p 'End Create Person'

p 'Start Create User'
require_relative './seeds_models/user.rb'
p 'End Create User'

p 'Start Create Psychologist'
require_relative './seeds_models/psychologist.rb'
p 'End Create Psychologist'

p 'Start Create Patient'
require_relative './seeds_models/patient.rb'
p 'End Create Patient'

p 'Start Create Specialty and Subspecialties'
require_relative './seeds_models/specialty.rb'
p 'End Create Specialty'

p 'Start Create Day'
require_relative './seeds_models/day.rb'
p 'End Create Day'

p 'Start Create Hour'
require_relative './seeds_models/hour.rb'
p 'End Create Hour'

p 'Start Create Schedule'
require_relative './seeds_models/schedule.rb'
p 'End Create Schedule'

p 'Start Add Specialty to a Psychologist'
require_relative './seeds_models/add_specialty.rb'
p 'End Add Specialty to a Psychologist'

p 'Start Create Diagnosis'
require_relative './seeds_models/diagnosis.rb'
p 'End Create Diagnosis'

p 'Start Create Appointment for Patient'
require_relative './seeds_models/appointment.rb'
p 'End Create Appointment for Patient'

p 'Start Create Ranking'
require_relative './seeds_models/ranking.rb'
p 'End Create Ranking'

p 'Start Create Comment'
require_relative './seeds_models/comment.rb'
p 'End Create Comment'