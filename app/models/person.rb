class Person < ApplicationRecord
  has_many :users, dependent: :destroy

  has_one_attached :avatar
end
