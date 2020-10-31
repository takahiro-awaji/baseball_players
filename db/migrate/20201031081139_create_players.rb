class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name,          null: false
      t.string :sex
      t.date :birthday
      t.string :main_position, null: false
      t.integer :number
      t.string :at_bat
      t.string :at_pitch
      t.string :sub_position
      t.string :player_post
      t.string :staff_post
      t.text :carrer
      t.text :promotion
      t.references :team,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
