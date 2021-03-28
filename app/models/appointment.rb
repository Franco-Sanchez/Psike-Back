class Appointment < ApplicationRecord
  belongs_to :schedule
  belongs_to :patient
  belongs_to :psychologist
  belongs_to :diagnosis
  has_one :ranking, dependent: :destroy
  has_one :transfer, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum status: { taken: 0, canceled: 1, completed: 2 }
end
