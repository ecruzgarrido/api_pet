require "rails_helper"

RSpec.describe Battle, type: :model do

  let(:first_fighter) { Pet.make! }

  describe '#once_battle_pet_day validation' do

    let(:second_fighter) { Pet.make! }

    let!(:first_battle) {
      Battle.make!(
          first_fighter_id: first_fighter.id,
          second_fighter_id: second_fighter.id,
          start: DateTime.now
      )
    }
    let!(:second_battle) {
      Battle.new(
        first_fighter_id: first_fighter.id,
        second_fighter_id: second_fighter.id,
        start: DateTime.now
    ) }

    it 'should be valid the first battle' do
      expect(first_battle).to be_valid
    end

    it 'should not be valid the second battle' do
      expect(second_battle).not_to be_valid
      expect(second_battle.errors[:first_fighter_id]).not_to be_empty
      expect(second_battle.errors[:second_fighter_id]).not_to be_empty
    end

  end

  describe '#different_owners validation' do

    let(:second_fighter) { Pet.make!(user_id: first_fighter.user_id ) }

    let!(:battle) {
      Battle.new(
          first_fighter_id: first_fighter.id,
          second_fighter_id: second_fighter.id,
          start: DateTime.now
      ) }

    it 'should not be valid the battle' do
      expect(battle).not_to be_valid
      expect(battle.errors[:base]).not_to be_empty
    end

  end

  describe 'winner validation' do

    let(:second_fighter) { Pet.make! }
    let(:third_fighter) { Pet.make! }

    let!(:battle) {
      Battle.new(
          first_fighter_id: first_fighter.id,
          second_fighter_id: second_fighter.id,
          start: DateTime.now,
          winner_id: third_fighter.id
      ) }

    it 'should not be valid with other pet' do
      expect(battle).not_to be_valid
      expect(battle.errors[:winner_id]).not_to be_empty
    end

  end

end