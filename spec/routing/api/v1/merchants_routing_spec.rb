require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/merchants', format: :json).to route_to('api/v1/merchants#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/api/v1/merchants/1', format: :json).to route_to('api/v1/merchants#show', format: :json, id: '1')
    end
  end
end
