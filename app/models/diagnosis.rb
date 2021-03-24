class Diagnosis < ApplicationRecord
  belongs_to :patient
  has_many :appointments, dependent: :destroy
end
