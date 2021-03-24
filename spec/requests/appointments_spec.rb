require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/appointments/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/appointments/create'
      expect(response).to have_http_status(:success)
    end
  end
end
