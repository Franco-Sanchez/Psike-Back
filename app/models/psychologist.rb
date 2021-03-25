class Psychologist < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :appointments, dependent: :nullify # la cita puede ser reasignada a otro psicologo
  has_many :patients, through: :appointments
  has_many :comments, through: :appointments
  has_and_belongs_to_many :specialties

  def self.get_index(psychologist)
    user = User.find(psychologist.user_id)
    person = Person.find(user.person_id)
    { id: psychologist.id, name: person.name, lastname: person.lastname,
      biography: psychologist.biography, comments_total: comments_total(psychologist),
      ranking_total: ranking_total(psychologist), price: psychologist.price,
      avatar: person.avatar, specialties: psychologist.specialties }
  end

  def self.get_show(psychologist)
    attributes = {  linkedIn: psychologist.linkedIn, comments: psychologist.comments,
                    schedules: schedules_render(psychologist),
                    appointments: psychologist.appointments }
    get_index(psychologist).merge(attributes)
  end

  def self.schedules_render(psychologist)
    psychologist.schedules.map do |schedule|
      { id: schedule.id, hour: Hour.find(schedule.hour_id), day: Day.find(schedule.day_id) }
    end
  end

  def self.ranking_total(psychologist)
    rankings = psychologist.appointments.map { |appointment| appointment.ranking.quantity }
    rankings.size.zero? ? rankings.size : rankings.reduce(0, :+) / rankings.size
  end

  def self.comments_total(psychologist)
    comments = psychologist.appointments.map { |appointment| appointment.comments.size }
    comments.reduce(0, :+)
  end
end
