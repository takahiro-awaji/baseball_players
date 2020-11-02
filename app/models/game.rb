class Game < ApplicationRecord
  belongs_to :team

  validates :gameday, presence: true
  validates :opponent, presence: true
  validates :total_stats_add, presence: true
  validates :top_or_bottom, presence: true
  validates :game_result, presence: true
end
