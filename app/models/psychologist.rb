class Psychologist < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :appointments, dependent: :nullify # la cita puede ser reasignada a otro psicologo
  has_many :patients, through: :appointments
  has_and_belongs_to_many :specialties
end
