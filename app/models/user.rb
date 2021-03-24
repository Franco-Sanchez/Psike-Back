class User < ApplicationRecord
  has_secure_password
  has_secure_token

  belongs_to :person
  # dependent: :destroy causes all the associated objects to also be destroyed
  has_many :psychologists, dependent: :destroy
  has_many :patients, dependent: :destroy

  enum role: { admin: 0, patient: 1, psychologist: 2 }

  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A\w+@gmail\.com\z/,
                              message: 'Your email should be similar to example@gmail.com' }
  validates :password, length: { minimum: 6 }, allow_nil: true

  def invalidate_token
    update(token: nil)
  end
end
