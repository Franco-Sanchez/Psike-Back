class AppointmentsController < ApplicationController
  skip_before_action :authorize, only: :index_psycho
  # before_action :found_patient
  before_action :paypal_init, except: [:index]

  # /psychologists/:psychologist_id/appointments
  def index_psycho
    psychologist = Psychologist.find(params[:psychologist_id])
    appointments_filter = psychologist.appointments.where(
      day: Time.zone.now..(Time.zone.now + 365.days), status: 0
    )
    appointments_render = appointments_filter.map do |appointment|
      Appointment.with_psychologist(appointment)
    end
    render json: appointments_render
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
    # Paypal
    request = PayPalCheckoutSdk::Orders::OrdersCaptureRequest.new(appointment_params['paypal_token'])
    response = @client.execute(request)
    order = response.result.to_h
    units = order[:purchase_units][0].to_h
    payments = units[:payments].to_h
    captures = payments[:captures][0].to_h
    amount = captures[:amount].to_h
    currency = (amount[:value].to_f * 100)
    transfer = Transfer.new(day: Time.zone.now, amount: currency, code: captures[:id])
    if transfer.save
      patient = Patient.find_by(user: current_user)
      diagnosis = patient.diagnoses.where(status: true).first
      appointment = Appointment.new(feedback: appointment_params['feedback'],
                                    reason: appointment_params['reason'],
                                    day: appointment_params['day'],
                                    schedule_id: appointment_params['schedule_id'],
                                    psychologist_id: appointment_params['psychologist_id'])
      appointment.diagnosis = diagnosis
      appointment.patient = patient
      appointment.transfer = transfer
      if appointment.save
        render json: appointment, status: :created
      else
        render json: appointment.errors, status: :bad_request
      end
    else
      render json: transfer.errors, status: :bad_request
    end
  rescue PayPalHttp::HttpError => e
    render json: { ok: e.status_code }
  end

  # PATCH /appointments/:id
  def update
    appointment = Appointment.find(params[:id])
    if appointment.update(url: params[:url])
      render json: appointment
    else
      render json: appointment.errors, status: :bad_request
    end
  end

  private

  def appointment_params
    params.permit(:feedback, :status, :day, :reason, :url, :psychologist_id,
                  :schedule_id, :transfer_id, :paypal_token)
  end

  def paypal_init
    client_id = 'AVKgL-6ajsbMZ0TH1037XNhGdy396YQ7PL8tqZebGAY9T55TbOVfYgOVBmfod49QZw2W7q9Okb5WLsuH'
    client_secret = 'EBjaPP799aU3a4_nMlgAj-uR-mbkfhJCDCwT20v1TVEbzTw_rJeTkVoZERKxh9FyuUnF-ESLd_50-dkQ'
    environment = PayPal::SandboxEnvironment.new client_id, client_secret
    @client = PayPal::PayPalHttpClient.new environment
  end
  # def found_patient
  #   @patient = Patient.find_by(user: current_user)
  # end
end
