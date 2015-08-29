class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.datetime :start
      t.references :first_fighter, index: true
      t.references :second_fighter, index: true
      t.references :winner, index: true

      t.timestamps
    end
  end
end
