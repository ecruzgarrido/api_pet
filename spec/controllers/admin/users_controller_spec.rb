require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do

  let(:admin) { User.make!(password: '12345678') }

  describe 'POST create' do

    context 'admin not signed_in' do

      before do
        do_create
      end

      it 'should redirect' do
        expect(response).to be_redirect
      end

      it 'should redirect to admin login' do
        expect(response).to redirect_to(new_admin_session_path)
      end

    end

    context 'admin signed_in' do

      before do
        just_sign_in_admin
      end

      context 'invalid attributes' do
        let(:invalid_attributes) { {
            email: 'user@example.com',
            password: '12345678',
            confirmation_password: '12345678'
        } }

        before do
          do_create(invalid_attributes)
        end

        it 'should be success' do
          expect(response).to be_success
        end

        it 'should be render new view' do
          expect(response).to render_template(:new)
        end

      end

      context 'valid attributes' do
        let(:valid_attributes) { {
            name: 'User',
            email: 'user@example.com',
            password: '12345678',
            confirmation_password: '12345678'
        } }
        let(:user) { User.make! }

        before do
          ActionMailer::Base.deliveries.clear
          do_create(valid_attributes)
        end

        it 'should redirect to user view' do
          expect(response).to redirect_to(admin_user_path(assigns[:user]))
        end

        it 'should be valid' do
          assigns[:user].should be_valid
        end

        it 'should send welcome email' do
          expect(ActionMailer::Base.deliveries.count).to eq(1)
        end

      end
    end

    def do_create(attributes = {})
      post :create, user: attributes
    end
  end

end