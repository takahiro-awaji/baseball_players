class CreateBattingStat < ActiveRecord::Migration[6.0]
  def change
    create_table :batting_stats do |t|
      t.string :at_field
      t.integer :batting_order
      t.string :fielding_position
      t.integer :at_standing
      t.integer :at_hitting
      t.integer :hit
      t.integer :run_batted_in
      t.integer :run
      t.integer :stolen_base
      t.integer :double
      t.integer :triple
      t.integer :homerun
      t.integer :strikeout
      t.integer :walk
      t.integer :hit_by_pitch
      t.integer :sacrifice_bunt
      t.integer :sacrifice_fly
      t.integer :double_play
      t.integer :opponent_error
      t.integer :fielding_error
      t.references :game,   null: false, foreign_key: true
      t.references :player, null: false, foreigh_key: true
      t.timestamps
    end
  end
end