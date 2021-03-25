class AppointmentsController < ApplicationController
  before_action :found_patient

  # GET /appointments
  def index
    psychologist = Psychologist.find_by(user: current_user)
    if @patient
      render json: @patient.appointments
    elsif psychologist
      render json: psychologist.appointments
    end
  end

  # POST /appointments
  def create
    diagnosis = @patient.diagnoses.where(status: false)
    appointment = Appointment.new(appointment_params)
    appointment.diagnosis = diagnosis
    appointment.patient = @patient
    if appointment.save
      render json: appointment, status: :created
    else
      render json: appointment.errors, status: :bad_request
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:feedback, :status, :day, :reason, :psychologist, :schedule)
  end

  def found_patient
    @patient = Patient.find_by(user: current_user)
  end
end
