class UsersController < ApplicationController
  skip_before_action :authorize, only: :create

  # GET /profile
  def show
    render json: current_user.person
  end

  # POST /signup
  def create
    person = Person.create(name: params[:name], lastname: params[:lastname])
    user = User.new(user_params)
    user.person = person
    if user.save
      render json: { token: user.token }, status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  # PATCH /profile
  def update; end

  # DELETE /profile
  def destroy
    current_user.destroy
    render status: :no_content
  end

  private

  def user_params
    params.permit(:email, :password, :role)
  end
end
