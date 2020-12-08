require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  describe 'POST create' do
    it 'saves a valid location' do
      post :create, params: { zipcode: 12345}
      expect(response.status).to eq(200)
    end

    it 'rejects an invalid location with an error message' do
      post :create, params: { zipcode: ''}
      body = JSON.parse(response.body)
      expect(body["error"]).to eq("Zipcode can't be blank")
      expect(body["status"]).to eq("unprocessable_entity")
    end
  end

end

