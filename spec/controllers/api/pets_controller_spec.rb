require "rails_helper"

RSpec.describe Api::PetsController, type: :controller do

  let(:user) { generate_user_with_authentication_token }

  describe 'GET index' do

    context 'if the sign_in params are invalid' do

      before do
        authentication_token(user, 'Invalid')
        do_index
      end

      it 'should be unauthenticated user' do
        expect(response).to be_api_error
      end

      it 'throws unauthenticated errors' do
        expect(response_parsed_body['error']).not_to be_nil
        expect(response_parsed_body['error_description']).not_to be_nil
      end
    end

    context 'if the sign_in params are valid' do

      let(:pets) { [
          Pet.make!,
          Pet.make!
      ] }

      before do
        pets
        authentication_token(user)
        do_index
      end

      it 'should be authenticated user' do
        expect(response).not_to be_api_error
      end

      it 'returns pets' do
        expect(response_parsed_body['response']).not_to be_empty
      end
    end

    def do_index
      get :index
    end
  end

  describe 'GET show' do

    let(:pet) { Pet.make!(user_id: user.id) }

    context 'if the sign_in params are invalid' do

      before do
        authentication_token(user, 'Invalid')
        do_show(pet.id)
      end

      it 'should be unauthenticated user' do
        expect(response).to be_api_error
      end

      it 'throws unauthenticated errors' do
        expect(response_parsed_body['error']).not_to be_nil
        expect(response_parsed_body['error_description']).not_to be_nil
      end
    end

    context 'if the sign_in params are valid' do

      before do
        authentication_token(user)
      end

      context 'pet does not belong to user' do

        let(:pet_another_user) { Pet.make! }

        before do
          do_show(pet_another_user.id)
        end

        it 'should be authenticated user' do
          expect(response).not_to be_api_error
        end

        it 'returns pet' do
          expect(response_parsed_body['response']).not_to be_empty
        end
      end

      context 'pet belongs to user' do

        before do
          do_show(pet.id)
        end

        it 'should be authenticated user' do
          expect(response).not_to be_api_error
        end

        it 'returns pet' do
          expect(response_parsed_body['response']).not_to be_empty
        end
      end

    end

    def do_show(id)
      get :show, id: id
    end
  end

  describe 'POST create' do

    let(:sex) { Sex.make! }
    let(:pet_type) { PetType.make! }

    context 'if the sign_in params are invalid' do

      before do
        authentication_token(user, 'Invalid')
        do_create
      end

      it 'should be unauthenticated user' do
        expect(response).to be_api_error
      end

      it 'throws unauthenticated errors' do
        expect(response_parsed_body['error']).not_to be_nil
        expect(response_parsed_body['error_description']).not_to be_nil
      end
    end

    context 'if the sign_in params are valid' do

      before do
        authentication_token(user)
      end

      context 'changes pet user' do

        let(:another_user) { generate_user }

        let(:valid_attributes) { {
            name: 'Pet',
            birthdate: Date.today,
            user_id: another_user.id,
            sex_id: sex.id,
            pet_type_id: pet_type.id
        } }

        before do
          do_create(valid_attributes)
        end

        it 'should be authenticated user' do
          expect(response).not_to be_api_error
        end

        it 'returns pet with authenticated user' do
          expect(response_parsed_body['response']['user_id']).not_to eq(another_user.id)
          expect(response_parsed_body['response']['user_id']).to eq(user.id)
        end
      end

      context 'pet belongs to user' do

        let(:valid_attributes) { {
            name: 'Pet',
            birthdate: Date.today,
            user_id: user.id,
            sex_id: sex.id,
            pet_type_id: pet_type.id
        } }

        before do
          do_create(valid_attributes)
        end

        it 'should be authenticated user' do
          expect(response).not_to be_api_error
        end

        it 'returns pet with authenticated user' do
          expect(response_parsed_body['response']['user_id']).to eq(user.id)
        end
      end

    end

    def do_create(attributes = {})
      post :create, pet: attributes
    end
  end

  describe 'PUT update' do

    let(:pet) { Pet.make!(user_id: user.id) }

    context 'if the sign_in params are invalid' do

      before do
        authentication_token(user, 'Invalid')
        do_update(pet.id)
      end

      it 'should be unauthenticated user' do
        expect(response).to be_api_error
      end

      it 'throws unauthenticated errors' do
        expect(response_parsed_body['error']).not_to be_nil
        expect(response_parsed_body['error_description']).not_to be_nil
      end
    end

    context 'if the sign_in params are valid' do

      before do
        authentication_token(user)
      end

      context 'pet does not belong to user' do

        let(:pet_another_user) { Pet.make! }

        let(:attributes) { {
            name: 'Updated Pet'
        } }

        before do
          do_update(pet_another_user.id, attributes)
        end

        it 'should be unauthenticated user' do
          expect(response).to be_api_error
        end

        it 'throws unauthenticated errors' do
          expect(response_parsed_body['error']).not_to be_nil
          expect(response_parsed_body['error_description']).not_to be_nil
        end
      end

      context 'pet belongs to user' do

        let(:attributes) { {
            name: 'Updated Pet'
        } }

        before do
          do_update(pet.id, attributes)
        end

        it 'should be authenticated user' do
          expect(response).not_to be_api_error
        end

        it 'returns updated pet' do
          expect(response_parsed_body['response']).not_to be_empty
        end
      end

    end

    def do_update(id, attributes = {})
      put :update, id: id, pet: attributes
    end
  end

  describe 'DELETE destroy' do

    let(:pet) { Pet.make!(user_id: user.id) }

    context 'if the sign_in params are invalid' do

      before do
        authentication_token(user, 'Invalid')
        do_delete(pet.id)
      end

      it 'should be unauthenticated user' do
        expect(response).to be_api_error
      end

      it 'throws unauthenticated errors' do
        expect(response_parsed_body['error']).not_to be_nil
        expect(response_parsed_body['error_description']).not_to be_nil
      end
    end

    context 'if the sign_in params are valid' do

      before do
        authentication_token(user)
      end

      context 'pet does not belong to user' do

        let(:pet_another_user) { Pet.make! }

        before do
          do_delete(pet_another_user.id)
        end

        it 'should be unauthenticated user' do
          expect(response).to be_api_error
        end

        it 'throws unauthenticated errors' do
          expect(response_parsed_body['error']).not_to be_nil
          expect(response_parsed_body['error_description']).not_to be_nil
        end
      end

      context 'pet belongs to user' do

        before do
          do_delete(pet.id)
        end

        it 'should be authenticated user' do
          expect(response).not_to be_api_error
        end

        it 'returns updated pet' do
          expect(response_parsed_body['response']).not_to be_empty
        end
      end

    end

    def do_delete(id)
      delete :destroy, id: id
    end
  end

  def response_parsed_body
    @response_parsed_body ||= response.parsed_body
  end
end