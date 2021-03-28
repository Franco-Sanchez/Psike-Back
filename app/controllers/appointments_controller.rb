class AppointmentsController < ApplicationController
  skip_before_action :authorize, only: :index_psycho
  # before_action :found_patient

  # /psychologists/:psychologist_id/appointments
  def index_psycho
    psychologist = Psychologist.find(params[:psychologist_id])
    appointments_filter = psychologist.appointments.where(
      day: Time.zone.now..(Time.zone.now + 7.days), status: 0
    )
    render json: appointments_filter
  end

  # GET /appointments
  def index
    patient = Patient.find_by(user: current_user)
    appointments_render = patient.appointments.map do |appointment|
      Appointment.get_index(appointment, current_user)
    end
    render json: appointments_render
  end

  # POST /appointments
  def create
    patient = Patient.find_by(user: current_user)
    diagnosis = patient.diagnoses.where(status: false).first # where te devuelve un array y por eso el first
    appointment = Appointment.new(appointment_params)
    appointment.diagnosis = diagnosis
    appointment.patient = patient
    if appointment.save
      render json: appointment, status: :created
    else
      render json: appointment.errors, status: :bad_request
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:feedback, :status, :day, :reason, :psychologist_id,
                                        :schedule_id, :transfer_id)
  end

  # def found_patient
  #   @patient = Patient.find_by(user: current_user)
  # end
end
