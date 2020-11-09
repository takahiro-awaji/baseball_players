# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_09_045916) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "batting_stats", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "at_field"
    t.integer "batting_order"
    t.string "fielding_position"
    t.integer "at_standing"
    t.integer "at_hitting"
    t.integer "hit"
    t.integer "run_batted_in"
    t.integer "run"
    t.integer "stolen_base"
    t.integer "double"
    t.integer "triple"
    t.integer "homerun"
    t.integer "strikeout"
    t.integer "walk"
    t.integer "hit_by_pitch"
    t.integer "sacrifice_bunt"
    t.integer "sacrifice_fly"
    t.integer "double_play"
    t.integer "opponent_error"
    t.integer "fielding_error"
    t.bigint "game_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_batting_stats_on_game_id"
    t.index ["player_id"], name: "index_batting_stats_on_player_id"
  end

  create_table "game_players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_game_players_on_game_id"
    t.index ["player_id"], name: "index_game_players_on_player_id"
  end

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "gameday", null: false
    t.string "gametime"
    t.string "opponent", null: false
    t.string "tournament_name"
    t.string "field_name"
    t.string "game_attribute"
    t.string "total_stats_add", null: false
    t.string "top_or_bottom", null: false
    t.integer "game_myteam_score"
    t.integer "game_opponent_score"
    t.string "game_result", null: false
    t.text "game_comment"
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_games_on_team_id"
  end

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "sex"
    t.date "birthday"
    t.integer "main_position_id", null: false
    t.integer "number"
    t.string "at_bat"
    t.string "at_pitch"
    t.string "sub_position"
    t.string "player_post"
    t.string "staff_post"
    t.text "carrer"
    t.text "promotion"
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "team_name", null: false
    t.string "team_name_kana", null: false
    t.string "team_url", null: false
    t.integer "activity_base_id", null: false
    t.integer "team_attribute_id", null: false
    t.integer "team_level_id"
    t.integer "team_player_age_id"
    t.integer "team_player_history_id"
    t.text "league"
    t.text "team_title"
    t.integer "since_id"
    t.string "activity_day"
    t.integer "activity_pace_id"
    t.integer "games_per_year_id"
    t.string "team_slogan"
    t.text "introduction"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_teams_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teams_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "games", "teams"
  add_foreign_key "players", "teams"
end
