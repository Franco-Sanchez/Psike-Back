class UsersController < ApplicationController
  skip_before_action :authorize, only: :create

  # GET /profile
  def show
    person = current_user.person
    render json: User.get_profile(person, current_user)
  end

  # POST /signup
  def create
    person = Person.new(person_params)
    if person.save
      create_user(person, user_params)
    else
      render json: person.errors, status: :bad_request
    end
  end

  # PATCH /profile
  def update
    if current_user.person.update(person_params)
      update_user
    else
      render json: current_user.person.errors, status: :bad_request
    end
  end

  # DELETE /profile
  def destroy
    current_user.destroy
    render status: :no_content
  end

  private

  def user_params
    params.permit(:email, :password, :role)
  end

  def person_params
    params.permit(:name, :lastname, :identity_document, :nationality, :birthdate, :avatar)
  end

  def create_user(person, params)
    user = User.new(params)
    user.person = person
    if user.save
      patient = Patient.create(user: user)
      Diagnosis.create(patient: patient)
      render json: User.get_profile(person, user), status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  def update_user
    if current_user.update(user_params)
      render json: current_user.person
    else
      render json: current_user.errors, status: :bad_request
    end
  end
end
