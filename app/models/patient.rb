class Patient < ApplicationRecord
  belongs_to :user
  has_many :diagnoses, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :psychologists, through: :appointments
end
