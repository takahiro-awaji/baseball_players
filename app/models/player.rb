class Player < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :main_position
  belongs_to :team

  validates :name, presence: true
  validates :main_position_id, presence: true, numericality: { other_than: 0, message: 'Select' }
end
