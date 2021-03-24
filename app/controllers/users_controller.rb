class UsersController < ApplicationController

  def show; end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :bad_request
    end
  end

  def update; end

  def destroy; end

  private

  def user_params
    params.permit(:email, :password)
  end
end
