class PsychologistsController < ApplicationController
  skip_before_action :authorize

  # GET /psychologists
  def index
    render json: Psychologist.all
  end

  # GET /psychologists/:id
  def show
    psychologist = Psychologist.find(params[:id])
    render json: psychologist
  end
end
