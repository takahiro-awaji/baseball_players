class CreatePitchingStats < ActiveRecord::Migration[6.0]
  def change
    create_table :pitching_stats do |t|
      t.integer :pitching_order
      t.string :win_lose_or_save
      t.integer :inning
      t.integer :part_of_inning
      t.integer :runs_allowed
      t.integer :earned_run
      t.string :complete_game
      t.string :shutout
      t.integer :hit_allowed
      t.integer :homerun_allowed
      t.integer :strikeout
      t.integer :base_on_ball_or_hit_by_pitch
      t.integer :balk
      t.integer :wild_pitch
      t.references :game,   null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.timestamps
    end
  end
end
