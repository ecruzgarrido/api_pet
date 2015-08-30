require "rails_helper"

RSpec.describe Api::SessionsController, type: :controller do

  let(:user) { User.make!(password: '12345678') }

  describe 'POST create' do

    context 'if the sign_in params are invalid' do
      let(:invalid_attributes) { {
          email: user.email,
          password: 'incorrect'
      } }

      before do
        do_create(invalid_attributes)
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
      let(:valid_attributes) { {
          email: user.email,
          password: '12345678'
      } }

      before do
        do_create(valid_attributes)
      end

      it 'should be authenticated user' do
        expect(response).not_to be_api_error
      end

      it 'returns token and id user' do
        expect(response_parsed_body['response']['user_id']).to eq(user.id)
        expect(response_parsed_body['response']['token']).to eq(user.reload.authentication_token)
      end
    end

    def do_create(attributes = {})
      post :create, user: attributes
    end

    def response_parsed_body
      @response_parsed_body ||= response.parsed_body
    end
  end

end