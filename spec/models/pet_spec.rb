require "rails_helper"

RSpec.describe Pet, type: :model do

  describe '#ratio_win' do

    let(:pet) { Pet.new }

    before(:each) do
      allow(pet).to receive(:first_fighters_count) { 5 }
      allow(pet).to receive(:second_fighters_count)  { 5 }
      allow(pet).to receive(:winners_count)  { 5 }
    end

    it 'should win half the battle' do
      pet.ratio_win.should eq(0.5)
    end

    it 'should not lost less than half the battle' do
      pet.ratio_win.should_not eq(0.3)
    end

  end

end