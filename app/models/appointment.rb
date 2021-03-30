class Appointment < ApplicationRecord
  belongs_to :schedule
  belongs_to :patient
  belongs_to :psychologist
  belongs_to :diagnosis
  belongs_to :transfer
  has_one :ranking, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum status: { taken: 0, canceled: 1, completed: 2 }

  validates :day, :reason, presence: true
  validate :in_the_past

  def in_the_past
    errors.add(:day, "Can't be in the past") if day && day < Time.zone.today
  end

  def self.with_psychologist(appointment)
    { id: appointment.id, status: appointment.status, reason: appointment.reason,
      date: appointment.day, schedule: get_schedule(appointment.schedule),
      feedback: appointment.feedback }
  end

  def self.get_index(appointment, current_user)
    person_psychologist = appointment.psychologist.user.person
    person_patient = current_user.person
    data_general(appointment, person_psychologist, person_patient)
  end

  def self.data_general(appointment, person_psychologist, person_patient)
    { id: appointment.id,
      psychologist: data_psychologist(appointment.psychologist, person_psychologist),
      patient: data_person(person_patient), feedback: appointment.feedback,
      date: appointment.day, schedule: get_schedule(appointment.schedule),
      status: appointment.status, reason: appointment.reason,
      diagnosis: get_diagnosis(appointment.diagnosis), transfer: get_transfer(appointment.transfer),
      comments: get_comments(appointment), ranking: get_ranking(appointment.ranking) }
  end

  def self.data_person(person)
    { name: person.name, lastname: person.lastname, identity_document: person.identity_document,
      nationality: person.nationality, birthdate: person.birthdate, avatar: person.avatar }
  end

  def self.data_psychologist(psychologist, person)
    attributes = {  biography: psychologist.biography, linkedIn: psychologist.linkedIn,
                    price: psychologist.price }
    data_person(person).merge(attributes)
  end

  def self.get_diagnosis(diagnosis)
    { title: diagnosis.title, diagnosis: diagnosis.diagnosis, status: diagnosis.status }
  end

  def self.get_transfer(transfer)
    { date: transfer.day, amount: transfer.amount, code: transfer.code }
  end

  def self.get_comments(appointment)
    appointment.comments.map { |comment| { description: comment.description } }
  end

  def self.get_ranking(ranking)
    { quantity: ranking.quantity, description: ranking.description }
  end

  def self.get_schedule(schedule)
    { id: schedule.id, hour: schedule.hour, day: schedule.day }
  end
end
