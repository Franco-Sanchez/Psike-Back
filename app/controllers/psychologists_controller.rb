class PsychologistsController < ApplicationController
  skip_before_action :authorize

  # GET /psychologists
  def index
    psychologists = Psychologist.all
    psychologists_render = psychologists.map { |psychologist| Psychologist.get_index(psychologist) }
    render json: psychologists_render
  end

  # GET /psychologists/:id
  def show
    psychologist = Psychologist.find(params[:id])
    render json: Psychologist.get_show(psychologist)
  end
end
