class Transfer < ApplicationRecord
  has_one :appointment, dependent: :destroy

  validates :amount, :day, presence: true # confirmar validacion del atributo 'code'

end
