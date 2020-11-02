class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.date :gameday,                null: false
      t.time :gametime
      t.string :opponent,             null: false
      t.string :tournament_name
      t.string :field_name
      t.string :game_attribute
      t.string :total_stats_add,      null: false
      t.string :top_or_bottom,        null: false
      t.integer :game_myteam_score
      t.integer :game_opponent_score
      t.string :game_result,          null: false
      t.text :game_comment
      t.references :team,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
