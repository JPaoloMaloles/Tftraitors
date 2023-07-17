# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_17_183538) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "match_summoner_performances", force: :cascade do |t|
    t.integer "match_id"
    t.integer "summoner_info_id"
    t.string "riot_match_id"
    t.string "puuid"
    t.integer "gold_left"
    t.integer "last_round"
    t.integer "placement"
    t.integer "players_eliminated"
    t.float "time_eliminated"
    t.integer "total_damage_to_players"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_augment"
    t.string "second_augment"
    t.string "third_augment"
    t.integer "companion_id"
    t.integer "level"
  end

  create_table "matches", force: :cascade do |t|
    t.string "data_version"
    t.string "riot_match_id"
    t.bigint "game_datetime"
    t.float "game_length"
    t.string "game_version"
    t.integer "queu_id"
    t.string "tft_game_type"
    t.string "tft_set_core_name"
    t.integer "tft_set_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "summoner_infos", force: :cascade do |t|
    t.string "puuid"
    t.string "tier"
    t.string "rank"
    t.integer "league_points"
    t.string "riot_summoner_id"
    t.string "summoner_name"
    t.integer "wins"
    t.integer "losses"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
  end

end
