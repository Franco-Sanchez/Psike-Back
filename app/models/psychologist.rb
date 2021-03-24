class Psychologist < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_and_belongs_to_many :specialties
end
