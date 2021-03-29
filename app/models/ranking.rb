class Ranking < ApplicationRecord
  belongs_to :appointment

  validates :quantity, inclusion: { in: [1, 2, 3, 4, 5],
                                    message: 'must exist and be between 1 and 5' }
end
