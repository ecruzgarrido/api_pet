class CreatePets < ActiveRecord::Migration
  def change
    create_table :pet_types do |t|
      t.string :code, index: true, unique: true
      t.string :name

      t.timestamps
    end

    create_table :sex do |t|
      t.string :code, index: true, unique: true
      t.string :name

      t.timestamps
    end

    create_table :pets do |t|
      t.string :name
      t.date :birthdate
      t.references :user, index: true
      t.references :pet_type, index: true
      t.references :sex, index: true
      t.integer :first_fighters_count, default: 0
      t.integer :second_fighters_count, default: 0
      t.integer :winners_count, default: 0

      t.timestamps
    end
  end
end
