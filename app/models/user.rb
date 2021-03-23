class User < ApplicationRecord
  has_secure_password
  has_secure_token

  enum role: { admin: 0, patient: 1, psychologist: 2 }

  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A\w+@gmail\.com\z/,
                              message: 'Your email must similar to example@gmail.com' }
  validates :password, length: { minimum: 6 }, allow_nil: true
end
