class Form::BattingStatCollection < Form::Base
  FORM_COUNT = 1 #ここで、作成したい登録フォームの数を指定
  attr_accessor :batting_stats

  def initialize(attributes = {})
    super attributes
    self.batting_stats = FORM_COUNT.times.map { BattingStat.new() } unless self.batting_stats.present?
  end

  def batting_stats_attributes=(attributes)
    self.batting_stats = attributes.map { |_, v| BattingStat.new(v) }
  end

  def save
    BattingStat.transaction do
      self.batting_stats.map do |batting_stat|
        if batting_stat.player_id # ここでチェックボックスにチェックを入れている商品のみが保存される
          batting_stat.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end