class Appointment < ApplicationRecord
  belongs_to :schedule
  belongs_to :patient
  belongs_to :psychologist
  belongs_to :diagnosis
  has_one :ranking, dependent: :destroy
  has_one :transfer, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum status: { taken: 0, canceled: 1, completed: 2 }

  def self.get_index(appointment, current_user)
    user_psychologist = User.find(appointment.psychologist.user_id)
    person_psychologist = Person.find(user_psychologist.person_id)
    person_patient = Person.find(current_user.person_id)
    data_general(appointment, person_psychologist, person_patient)
  end

  def self.data_general(appointment, person_psychologist, person_patient)
    { id: appointment.id,
      psychologist: data_psychologist(appointment.psychologist, person_psychologist),
      patient: data_person(person_patient), feedback: appointment.feedback,
      schedule: get_schedule(appointment.schedule), status: appointment.status,
      reason: appointment.reason, diagnosis: get_diagnosis(appointment.diagnosis),
      transfer: get_transfer(appointment.transfer), comments: get_comments(appointment),
      ranking: get_ranking(appointment.ranking) }
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
    { hour: Hour.find(schedule.hour_id), day: Day.find(schedule.day_id) }
  end
end
