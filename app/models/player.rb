class Player < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :main_position
  belongs_to :team
  has_one_attached :image
  has_many :games, through: :batting_stats, through: :pitching_stats
  has_many :batting_stats
  has_many :pitching_stats

  validates :name, presence: true
  validates :main_position_id, presence: true, numericality: { other_than: 0, message: 'を選択してください' }
end
