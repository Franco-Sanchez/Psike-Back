class User < ApplicationRecord
  has_secure_token

  enum role: { visitor: 0, admin: 1, patient: 2, psychologist: 3 }

  validates :email, presence: true, uniqueness: true
end
