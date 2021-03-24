class Hour < ApplicationRecord
  has_many :schedules, dependent: :destroy
end
