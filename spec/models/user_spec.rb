require "rails_helper"

RSpec.describe User, type: :model do

  describe '#generate_authentication_token' do

    let(:user) { User.make!(
        name: 'User',
        email: 'mail@example.com',
        password: '12345678'
    ) }

    let(:authentication_token) { user.generate_authentication_token }

    before(:each) do
      authentication_token
    end

    it 'should win half the battle' do
      expect(user.authentication_token).to eq(authentication_token)
    end

  end

end