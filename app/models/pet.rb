class Pet < ActiveRecord::Base

  validates_presence_of :name, :birthdate, :user, :sex, :pet_type

  belongs_to :user
  belongs_to :sex
  belongs_to :pet_type

  has_many :first_fighter_battles, class_name: 'Battle', foreign_key: 'first_fighter_id', dependent: :destroy
  has_many :second_fighter_battles, class_name: 'Battle', foreign_key: 'second_fighter_id', dependent: :destroy
  has_many :winners, class_name: 'Battle', foreign_key: 'winner_id', dependent: :destroy

  def ratio_win
    winners_count.to_f / (first_fighters_count + second_fighters_count)
  end
end