# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
SummonerInfo.create!(
  puuid: "test_puuid",
  tier: "test_tier",
  rank: "test_rank",
  league_points: 1,
  riot_summoner_id: "test_summoner_id",
  summoner_name: "test_summoner_name",
  wins: 1,
  losses: 1,
)

Match.create!(
  data_version: "test_data_version",
  riot_match_id: "test_riot_match_id",
  game_datetime: 1,
  game_length: 1,
  game_version: "test_game_version",
  queu_id: 1,
  tft_game_type: "test_tft_game_type",
  tft_set_core_name: "test_tft_set_core_name",
  tft_set_number: 1,
)
