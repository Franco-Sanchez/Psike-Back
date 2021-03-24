class AppointmentsController < ApplicationController
  def index
    patient = Patient.find_by(user: current_user)
    psychologist = Psychologist.find_by(user: current_user)
    if patient
      render json: patient.appointments
    elsif psychologist
      render json: psychologist.appointments
    end
  end

  def create; end
end
