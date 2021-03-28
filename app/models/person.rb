class Person < ApplicationRecord
  has_many :users, dependent: :destroy

  has_one_attached :avatar

  validates :name, :lastname, presence: true
  validate :in_the_future

  private

  def in_the_future
    errors.add(:birthdate, "Can't be in the future") if birthdate && birthdate > Time.zone.today
  end
end
