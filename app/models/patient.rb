class Patient < ApplicationRecord
  belongs_to :user
  has_many :diagnoses, dependent: :destroy
end
