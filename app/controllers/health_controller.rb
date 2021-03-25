class HealthController < ApplicationController
  skip_before_action :authorize

  def index
    render json: { ok: true }
  end
end
