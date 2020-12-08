require 'rails_helper'

RSpec.describe ForecastsController, type: :controller do

  describe 'POST get_forecast' do
    it 'creates a valid forecast' do
      post :get_forecast, params: { zipcode: 12345}
      expect(response.status).to eq(200)
    end

    it 'rejects an invalid forecast with an error message' do
      post :get_forecast, params: { zipcode: ''}
      body = JSON.parse(response.body)
      expect(body["error"]).to eq("Zipcode can't be blank")
      expect(body["status"]).to eq("unprocessable_entity")
    end
  end

end
