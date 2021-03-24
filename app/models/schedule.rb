class Schedule < ApplicationRecord
  belongs_to :hour
  belongs_to :day
  has_many :appointments, dependent: :destroy
end
