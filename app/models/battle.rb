class Battle < ActiveRecord::Base

  validates_presence_of :start, :first_fighter, :second_fighter

  #Pet fight once day validation
  validate :once_battle_pet_day, if: :start

  #Owner validation
  validate :different_owners, if: :check_fighters?

  #Winner validation that it's one of the fighters
  validates_inclusion_of :winner_id, in: ->(battle) { [
                                       battle.first_fighter_id,
                                       battle.second_fighter_id
                                   ] },
                         allow_blank: true

  belongs_to :first_fighter, class_name: 'Pet', counter_cache: :first_fighters_count
  belongs_to :second_fighter, class_name: 'Pet', counter_cache: :second_fighters_count
  belongs_to :winner, class_name: 'Pet', counter_cache: :winners_count

  scope :by_start, ->(start_date) {
    where('DATE(start) = ?', start_date.to_date)
  }
  scope :by_pet, ->(pet) {
    where('first_fighter_id = ? OR second_fighter_id = ?', pet.try(:id), pet.try(:id))
  }

  protected

    def once_battle_pet_day
      battle_by_pet_and_day = battle_by_pet_and_day(self.first_fighter)
      if first_fighter_id && !battle_by_pet_and_day.empty? && battle_by_pet_and_day.first != self
        errors.add(:first_fighter_id, I18n.t('activerecord.errors.models.battle.battle_for_day'))
      end

      battle_by_pet_and_day = battle_by_pet_and_day(self.second_fighter)
      if second_fighter_id && !battle_by_pet_and_day.empty? && battle_by_pet_and_day.first != self
        errors.add(:second_fighter_id, I18n.t('activerecord.errors.models.battle.battle_for_day'))
      end
    end

    def different_owners
      errors.add(:base, I18n.t('activerecord.errors.models.battle.different_owners')) if same_owner
    end

  private

    def battle_by_pet_and_day(pet)
      Battle.by_start(self.start).by_pet(pet)
    end

    def check_fighters?
      first_fighter_id && second_fighter_id
    end

    def same_owner
      first_fighter.user_id == second_fighter.user_id
    end

end