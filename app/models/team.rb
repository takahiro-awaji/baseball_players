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
  belongs_to_active_hash :team_level
  belongs_to_active_hash :team_player_age
  belongs_to_active_hash :team_player_history
  belongs_to_active_hash :since

  has_many :players
  has_many :games
  has_one_attached :image

  # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # validates_format_of :password, with: PASSWORD_REGEX, message: 'は英文字と数字を両方使用してください'

  with_options presence: true do
    validates :team_name
    validates :team_name_kana
    validates :team_url, uniqueness: true
    with_options numericality: { other_than: 0, message: 'を選択してください' } do
      validates :activity_base_id
      validates :team_attribute_id
    end
  end

  def self.search(search)
    if search != ''
      Team.where('team_name LIKE (?)', "%#{search}%")
    else
      Team.all
    end
  end
end
