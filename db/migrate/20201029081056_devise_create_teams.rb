# frozen_string_literal: true

class DeviseCreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name,               null: false
      t.string :name_kana,          null: false
      t.string :url,                null: false, uniqueness: true
      t.integer :activity_base_id,  null: false
      t.integer :attribute_id,      null: false
      t.integer :level_id
      t.integer :player_age_id
      t.integer :player_history_id
      t.text :league
      t.text :title
      t.integer :since_id
      t.string :actiity_day
      t.integer :activity_pace_id
      t.integer :games_per_year_id
      t.string :slogan
      t.text :introduction
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :teams, :email,                unique: true
    add_index :teams, :reset_password_token, unique: true
    # add_index :teams, :confirmation_token,   unique: true
    # add_index :teams, :unlock_token,         unique: true
  end
end
