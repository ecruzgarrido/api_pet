require "rails_helper"

RSpec.describe User, type: :model do

  describe '#generate_authentication_token' do

    let(:user) { User.make! }

    before do
      user.generate_authentication_token
    end

    it 'should win half the battle' do
      expect(user.authentication_token).not_to be_blank
    end

  end

end