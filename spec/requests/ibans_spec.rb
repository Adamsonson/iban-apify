require 'rails_helper'

describe 'Ibans API', type: :request do
  let!(:iban) { FactoryBot.create(:iban, name: 'albanian', iban_number: 'AL35202111090000000001234567') }

  describe 'GET /api/v1/ibans' do
    it 'returns all ibans' do
      get '/api/v1/ibans'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'POST /api/v1/ibans' do
    it 'create a new iban' do
      expect do
        post '/api/v1/ibans', params: { iban: { name: 'belgian', iban_number: 'BE71096123456769' } }
      end.to change { Iban.count }.from(1).to(2)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'PATCH/PUT /api/v1/ibans/:id' do
    it 'update an iban' do
      put "/api/v1/ibans/#{iban.id}", params: { iban: { name: 'albanian2', iban_number: 'AL35202111090000000001234567' } }

      expect(Iban.find(iban.id).name).to eq('albanian2')
      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /api/v1/ibans/:id' do
    it 'delete an iban' do
      expect do
        delete "/api/v1/ibans/#{iban.id}"
      end.to change { Iban.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end