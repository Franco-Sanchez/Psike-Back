class Person < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
end