class Schedule < ApplicationRecord
  belongs_to :hour
  belongs_to :day
  belongs_to :psychologist
  has_many :appointments, dependent: :destroy
end
