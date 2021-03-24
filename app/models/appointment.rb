class Appointment < ApplicationRecord
  belongs_to :schedule
  belongs_to :patient
  belongs_to :psychologist
  belongs_to :diagnosis
  has_one :ranking, dependent: :destroy

  enum status: { free: 0, taken: 1, canceled: 2, completed: 3 }
end
