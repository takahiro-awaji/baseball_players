class Form::PitchingStatCollection < Form::Base
  FORM_COUNT = 1 # ここで、作成したい登録フォームの数を指定
  attr_accessor :pitching_stats

  def initialize(attributes = {})
    super attributes
    self.pitching_stats = FORM_COUNT.times.map { PitchingStat.new } unless pitching_stats.present?
  end

  def pitching_stats_attributes=(attributes)
    self.pitching_stats = attributes.map { |_, v| PitchingStat.new(v) }
  end

  def save
    PitchingStat.transaction do
      pitching_stats.map do |pitching_stat|
        pitching_stat.save if pitching_stat.player_id # ここでチェックボックスにチェックを入れている商品のみが保存される
      end
    end
    true
  rescue StandardError => e
    false
  end
end
