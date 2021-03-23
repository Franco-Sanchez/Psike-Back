class Day < ApplicationRecord
  has_many :schedules, dependent: :destroy
end
