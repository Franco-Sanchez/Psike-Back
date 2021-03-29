class Transfer < ApplicationRecord
  has_one :appointment, dependent: :destroy

  validates :amount, :day, presence: true # confirmar validacion del atributo 'code'
  validate :in_the_past

  private

  def in_the_past
    errors.add(:day, "Can't be in the past") if day && day < Time.zone.today
  end
end
