class Transfer < ApplicationRecord
  has_one :appointment, dependent: :destroy
end
