class AddPlayerSkillToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :batting, :integer
    add_column :players, :power, :integer
    add_column :players, :running, :integer
    add_column :players, :throwing, :integer
    add_column :players, :fielding, :integer
    add_column :players, :speedball, :integer
    add_column :players, :control, :integer
    add_column :players, :stamina, :integer
    add_column :players, :breakingball, :integer
    add_column :players, :fielding_of_pitcher, :integer
  end
end
