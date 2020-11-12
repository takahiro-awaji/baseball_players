FactoryBot.define do
  factory :team do
    email                   { Faker::Internet.free_email }
    password                { 'osaka1234' }
    password_confirmation   { password }
    team_name               { '大阪ヤンキース' }
    team_name_kana          { 'オオサカヤンキース' }
    team_url                { Faker::Alphanumeric.alpha(number: 10) }
    activity_base_id        { Faker::Number.within(range: 1..47) }
    team_attribute_id       { Faker::Number.within(range: 1..19) }
    team_level_id           { Faker::Number.within(range: 1..7) }
    team_player_age_id      { Faker::Number.within(range: 1..13) }
    team_player_history_id  { Faker::Number.within(range: 1..7) }
    league                  { "大阪府中央区リーグ所属" }
    team_title              { "第95回大阪府大会優勝" }
    since_id                { Faker::Number.within(range: 1..12) }
    activity_day            { "日" }
    activity_pace_id        { Faker::Number.within(range: 1..6) }
    games_per_year_id       { Faker::Number.within(range: 1..5) }
    team_slogan             { "一戦必勝" }
    introduction            { "よろしくお願いします" }
  end
end