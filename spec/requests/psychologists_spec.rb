require 'rails_helper'

RSpec.describe 'Psychologists', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/psychologists/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/psychologists/show'
      expect(response).to have_http_status(:success)
    end
  end
end
