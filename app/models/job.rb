class Job < ApplicationRecord
  belongs_to :psychologist

  validates :start_date, :position, :enterprise, presence: true
  validate :in_the_future
  validate :before_start_date

  private

  def in_the_future
    errors.add(:start_date, "Can't be in the future") if start_date && start_date > Time.zone.today
  end

  def before_start_date
    errors.add(:end_date, "Can't be before than start_date") if end_date && end_date < start_date
  end
end
