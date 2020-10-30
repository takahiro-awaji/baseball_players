class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :activity_base
  belongs_to_active_hash :team_attribute
  belongs_to_active_hash :activity_pace
  belongs_to_active_hash :games_per_year
  belongs_to_active_hash :level
  belongs_to_active_hash :player_age
  belongs_to_active_hash :player_history
  belongs_to_active_hash :since

  with_options presence: true do
    validates :name
    validates :name_kana
    validates :url, uniqueness: true
    with_options numericality: { other_than: 0, message: 'Select' } do
      validates :activity_base_id
      validates :attribute_id
    end
  end
end
