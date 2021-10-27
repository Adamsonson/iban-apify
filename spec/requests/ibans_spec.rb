require 'rails_helper'

describe 'Ibans API', type: :request do
  let!(:iban) { FactoryBot.create(:iban, name: 'albanian', iban_number: 'AL35202111090000000001234567') }
  let!(:iban_two) { FactoryBot.create(:iban, name: 'greece', iban_number: 'GR35202111090000000001234567') }

  describe 'GET /api/v1/ibans' do
    it '#index' do
      get '/api/v1/ibans'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it '#show' do
      get "/api/v1/ibans/#{iban.id}"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end

    context 'search by name param' do
      it 'returns 1 match' do
        get '/api/v1/ibans?name=alba'

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(1)
      end

      it 'returns 0 matches' do
        get '/api/v1/ibans?name=albas'

        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(0)
      end
    end

    it '#random' do
      get '/api/v1/ibans/random'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'POST /api/v1/ibans' do
    it 'create a new iban' do
      expect do
        post '/api/v1/ibans', params: { iban: { name: 'belgian', iban_number: 'BE71096123456769' } }
      end.to change { Iban.count }.from(2).to(3)

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
      end.to change { Iban.count }.from(2).to(1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
