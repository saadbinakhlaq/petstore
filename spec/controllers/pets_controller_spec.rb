require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  context 'when user is authenticated' do
    context 'when user authorized' do
      let(:shelter) { create(:shelter, :with_pets) }

      subject do
        get :index, params: {
          shelter_id: shelter.id
        }, format: :json
      end

      it 'renders list of animals' do
        user = create(:user)
        user.create_account(account_type: 'shelter', shelter: shelter)
        sign_in user
        subject

        expect(response).to have_http_status(:ok)
        expect(response.body).to have_json_path('pets')
        expect(JSON.parse(response.body)['pets'].count).to eq(20)
      end
    end

    context 'when user is not authorized' do
      let(:shelter) { create(:shelter) }

      subject do
        get :index, params: {
          shelter_id: shelter.id
        }, format: :json
      end

      it 'renders forbidden' do
        user = create(:user)
        user.create_account(account_type: 'shelter', shelter: create(:shelter))

        sign_in user

        subject
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  context 'when user is not authenticated' do
    subject do
      get :index, params: {
        shelter_id: 1
      }, format: :json
    end
    it 'renders unauthorized' do
      subject
      expect(response).to have_http_status(:unauthorized)
    end
  end
end