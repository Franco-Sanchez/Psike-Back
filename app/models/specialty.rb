class Specialty < ApplicationRecord
  belongs_to :parent, class_name: 'Specialty', optional: true
  has_many :subspecialties, class_name: 'Specialty', foreign_key: 'parent_id',
                            dependent: :nullify, inverse_of: false
  has_and_belongs_to_many :psychologists

  enum type: { main_specialty: 0, subspecialty: 1 }

  validates :type, presence: true
end
