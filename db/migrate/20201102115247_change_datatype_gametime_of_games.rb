class ChangeDatatypeGametimeOfGames < ActiveRecord::Migration[6.0]
  def change
    change_column :games, :gametime, :string
  end
end
