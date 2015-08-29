class AddDeviseToUsers < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      # Token authenticatable
      t.string :authentication_token
    end

    add_index :users, :confirmation_token,   unique: true
    add_index :users, :authentication_token,   unique: true
  end

end
