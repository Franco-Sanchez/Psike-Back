class Specialty < ApplicationRecord
  belongs_to :parent, class_name: 'Specialty', optional: true
  has_many :subspecialties, class_name: 'Specialty', foreign_key: 'parent_id',
                            dependent: :nullify, inverse_of: false
  has_and_belongs_to_many :psychologists

  enum category: { main_specialty: 0, subspecialty: 1 }

  validates :category, presence: true
  validate :parent_validation

  private

  def parent_validation
    if subspecialty?
      return if Specialty.exists?(parent_id)

      errors.add(:parent_id, 'Should be a validate Specialty id')
    elsif main_specialty?
      errors.add(:parent_id, 'Shoul be null if main_specialty') unless parent_id.nil?
    end
  end
end
