class Person < ApplicationRecord
  has_many :users, dependent: :destroy

  has_one_attached :avatar

  validates :name, :lastname, presence: true
end
