class User < ApplicationRecord
  has_secure_token

  enum role: { admin: 0, patient: 1, psychologist: 2 }

  validates :email, presence: true, uniqueness: true
end
