class Form::PitchingStatCollection < Form::Base
  FORM_COUNT = 1 #ここで、作成したい登録フォームの数を指定
  attr_accessor :pitching_stats

  def initialize(attributes = {})
    super attributes
    self.pitching_stats = FORM_COUNT.times.map { PitchingStat.new() } unless self.pitching_stats.present?
  end

  def pitching_stats_attributes=(attributes)
    self.pitching_stats = attributes.map { |_, v| PitchingStat.new(v) }
  end

  def save
    PitchingStat.transaction do
      self.pitching_stats.map do |pitching_stat|
        if pitching_stat.player_id # ここでチェックボックスにチェックを入れている商品のみが保存される
          pitching_stat.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end