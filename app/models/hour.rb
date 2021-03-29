class Hour < ApplicationRecord
  has_many :schedules, dependent: :destroy

  validates :start_hour, :end_hour, presence: true
  validate :before_start_hour

  private

  def before_start_hour
    errors.add(:end_hour, "Can't be before than start_hour") if end_hour && end_hour < start_hour
  end
end
