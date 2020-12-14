class Game < ApplicationRecord
  belongs_to :team
  has_many :players, through: :batting_stats, through: :pitching_stats
  has_many :batting_stats
  has_many :pitching_stats

  with_options presence: true do
    validates :gameday
    validates :opponent
    validates :total_stats_add
    validates :top_or_bottom
    validates :game_result
  end

  def self.search(search)
    if search != ''
      Game.where('opponent LIKE (?)', "%#{search}%")
    else
      Game.all
    end
  end
end
