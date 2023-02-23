require 'rails_helper'

RSpec.describe :merchants, type: :request do
  include_examples 'API'

  describe '#index' do
    context 'without any merchant in the database' do
      subject { JSON.parse response.body }

      before do
        get '/api/v1/merchants', headers: valid_headers
      end

      it 'returns empty results set' do
        expect(subject).to be_empty
      end
    end

    context 'with merchants' do
      let!(:merchant) { create(:merchant) }
      let!(:disbursement) { create(:disbursement, merchant: merchant) }

      subject { JSON.parse response.body }

      before do
        get '/api/v1/merchants', headers: valid_headers
      end

      it 'is an array' do
        expect(subject).to be_kind_of Array
      end

      it 'returns merchant data' do
        expect(subject.first['id']).to eq merchant.id
        expect(subject.first['email']).to eq merchant.email
        expect(subject.first['name']).to eq merchant.name
        expect(subject.first['cif']).to eq merchant.cif
      end

      it 'returns disbursement data' do
        expect(subject.first['disbursements']).to be_kind_of Array
        expect(subject.first['disbursements'].first['id']).to eq disbursement.id
        expect(subject.first['disbursements'].first['fee']).to eq disbursement.fee.to_s
        expect(subject.first['disbursements'].first['calculated_at']).to eq disbursement.calculated_at.strftime('%FT%T.%LZ')
        expect(subject.first['disbursements'].first['calculated_since']).to eq disbursement.calculated_since.strftime('%FT%T.%LZ')
        expect(subject.first['disbursements'].first['calculated_to']).to eq disbursement.calculated_to.strftime('%FT%T.%LZ')
      end
    end
  end

  describe '#show' do
    context 'without any merchant in the database' do
      before do
        get '/api/v1/merchants/1', headers: valid_headers
      end

      it 'returns empty results set' do
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'with merchant' do
      let!(:merchant) { create(:merchant) }
      let!(:disbursement) { create(:disbursement, merchant: merchant) }

      subject { JSON.parse response.body }

      before do
        get "/api/v1/merchants/#{merchant.id}", headers: valid_headers
      end

      it 'returns merchant data' do
        expect(subject['id']).to eq merchant.id
        expect(subject['email']).to eq merchant.email
        expect(subject['name']).to eq merchant.name
        expect(subject['cif']).to eq merchant.cif
      end

      it 'returns disbursement data' do
        expect(subject['disbursements']).to be_kind_of Array
        expect(subject['disbursements'].first['id']).to eq disbursement.id
        expect(subject['disbursements'].first['fee']).to eq disbursement.fee.to_s
        expect(subject['disbursements'].first['calculated_at']).to eq disbursement.calculated_at.strftime('%FT%T.%LZ')
        expect(subject['disbursements'].first['calculated_since']).to eq disbursement.calculated_since.strftime('%FT%T.%LZ')
        expect(subject['disbursements'].first['calculated_to']).to eq disbursement.calculated_to.strftime('%FT%T.%LZ')
      end
    end
  end
end
