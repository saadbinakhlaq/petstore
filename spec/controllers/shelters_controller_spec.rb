require 'rails_helper'

RSpec.describe SheltersController, type: :controller do
  describe 'POST #create' do
    context 'when user is logged in' do
      context 'when is authorized to create a shelter' do
        subject do
          post :create, params: {
            "shelter": {
              "name": "string",
              "address": "string",
              "city": "string",
              "postcode": "string"
            }
          }, format: :json
        end

        it 'creates a shelter' do
          admin_shelter = create(:shelter, :admin)
          admin_user = create(:user)
          admin_user.create_account(shelter: admin_shelter, account_type: 'admin')

          sign_in admin_user
          expect {
            subject
            expect(response).to have_http_status(:created)
          }.to change { Shelter.count }.by(1)
        end

        context 'when required params are missing' do
          subject do
            post :create, params: {
              "name": "string",
              "address": "string",
              "city": "string",
              "postcode": "string"
            }
          end
  
          it 'responds with bad request' do
            admin_shelter = create(:shelter, :admin)
            admin_user = create(:user)
            admin_user.create_account(shelter: admin_shelter, account_type: 'admin')
  
            sign_in admin_user
            expect {
              subject
              expect(response).to have_http_status(:bad_request)
            }.to change { Shelter.count }.by(0)
          end
        end

        context 'when required params are not given' do
          subject do
            post :create, params: {
              "shelter": {
                "address": "string",
                "city": "string",
                "postcode": "string"
              }
            }, format: :json
          end

          it 'responds with bad request' do
            admin_shelter = create(:shelter, :admin)
            admin_user = create(:user)
            admin_user.create_account(shelter: admin_shelter, account_type: 'admin')

            sign_in admin_user
            expect {
              subject
              expect(response).to have_http_status(:unprocessable_entity)
            }.to change { Shelter.count }.by(0)
          end
        end
      end

      context 'when user is not authorized to create a shelter' do
        subject do
          post :create, params: {
            "shelter": {
              "name": "string",
              "address": "string",
              "city": "string",
              "postcode": "string"
            }
          }, format: :json
        end

        it 'responds with forbidden' do
          shelter = create(:shelter)
          shelter_user = create(:user)
          shelter_user.create_account(shelter: shelter)

          sign_in shelter_user

          expect{
            subject
            expect(response).to have_http_status(:forbidden)
          }
        end
      end
    end

    context 'when user is not logged in' do
      subject do
        post :create, params: {
          "shelter": {
            "name": "string",
            "address": "string",
            "city": "string",
            "postcode": "string"
          }
        }, format: :json
      end

      it 'responds with unauthorized' do
        subject
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end