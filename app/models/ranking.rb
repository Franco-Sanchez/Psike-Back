class Ranking < ApplicationRecord
  belongs_to :appointment

  validates :quantity, inclusion: { in: [1, 2, 3, 4, 5] }
end
