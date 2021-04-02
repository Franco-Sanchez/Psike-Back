class Psychologist < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :appointments, dependent: :nullify # la cita puede ser reasignada a otro psicologo
  has_many :patients, through: :appointments
  has_many :comments, through: :appointments
  has_and_belongs_to_many :specialties

  validates :biography, :price, presence: true

  def self.get_index(psychologist)
    person = psychologist.user.person
    { id: psychologist.id, name: person.name, lastname: person.lastname,
      biography: psychologist.biography, comments_total: comments_total(psychologist),
      ranking_total: ranking_total(psychologist), price: psychologist.price,
      avatar: Person.response_avatar(person),
      specialties: specialties_render(psychologist) }
  end

  def self.get_show(psychologist)
    attributes = {  linkedIn: psychologist.linkedIn, comments: get_comments(psychologist),
                    schedules: schedules_render(psychologist) }
    get_index(psychologist).merge(attributes)
  end

  def self.schedules_render(psychologist)
    psychologist.schedules.map do |schedule|
      { id: schedule.id, hour: Hour.find(schedule.hour_id), day: Day.find(schedule.day_id) }
    end
  end

  def self.specialties_render(psychologist)
    psychologist.specialties.map do |specialty|
      { name: specialty.name, subspecialties: specialty.subspecialties.map(&:name) }
    end
  end

  def self.ranking_total(psychologist)
    appointments_filter = psychologist.appointments.filter(&:ranking)
    rankings = appointments_filter.map { |appointment| appointment.ranking.quantity }
    rankings.size.zero? ? 0 : rankings.reduce(0, :+) / rankings.size.to_f
  end

  def self.comments_total(psychologist)
    comments = psychologist.appointments.map { |appointment| appointment.comments.size }
    comments.reduce(0, :+)
  end

  def self.get_comments(psychologist)
    psychologist.comments.map do |comment|
      person_patient = comment.patient.user.person
      { patient: { name: person_patient.name, lastname: person_patient.lastname,
                   avatar: Person.response_avatar(person_patient) },
        description: comment.description,
        category: comment.category }
    end
  end
end
