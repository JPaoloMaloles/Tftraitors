User.create!(name: "Test", email: "email@gmail.com", password: "password", password_confirmation: "password", admin:"true")

SummonerInfo.create!(
  puuid: "test_puuid",
  region: "test_region",
  tier: "test_tier",
  rank: "test_rank",
  league_points: 1,
  riot_summoner_id: "test_summoner_id",
  summoner_name: "test_summoner_name",
  wins: 1,
  losses: 1,
  profile_icon_id: 1,
)

Match.create!(
  data_version: "test_data_version",
  riot_match_id: "test_riot_match_id",
  game_datetime: 1,
  game_length: 1.1,
  game_version: "test_game_version",
  queu_id: 1,
  tft_game_type: "test_tft_game_type",
  tft_set_core_name: "test_tft_set_core_name",
  tft_set_number: 1,
)

MatchSummonerPerformance.create!(
  match_id: 1,
  summoner_info_id: 1,
  riot_match_id: "test_riot_match_id",
  puuid: "test_puuid",
  gold_left: 1,
  last_round: 1,
  level: 1,
  placement: 1,
  players_eliminated: 1,
  time_eliminated: 1.1,
  total_damage_to_players: 1,
  first_augment: "test_first_augment",
  second_augment: "test_second_augment",
  third_augment: "test_third_augment",
  companion_id: 1,
  traits_id: 1,
  units_id: 1,
)
#------------------------------------------------------------------------------------------
SummonerInfo.create!(
  puuid: "2test_puuid",
  region: "2test_region",
  tier: "2test_tier",
  rank: "2test_rank",
  league_points: 2,
  riot_summoner_id: "2test_summoner_id",
  summoner_name: "2test_summoner_name",
  wins: 2,
  losses: 2,
  profile_icon_id: 2,
)

Match.create!(
  data_version: "2test_data_version",
  riot_match_id: "2test_riot_match_id",
  game_datetime: 2,
  game_length: 2.2,
  game_version: "2test_game_version",
  queu_id: 2,
  tft_game_type: "2test_tft_game_type",
  tft_set_core_name: "2test_tft_set_core_name",
  tft_set_number: 2,
)

MatchSummonerPerformance.create!(
  match_id: 2,
  summoner_info_id: 2,
  riot_match_id: "2test_riot_match_id",
  puuid: "2test_puuid",
  gold_left: 2,
  last_round: 2,
  level: 2,
  placement: 2,
  players_eliminated: 2,
  time_eliminated: 2.2,
  total_damage_to_players: 2,
  first_augment: "2test_first_augment",
  second_augment: "2test_second_augment",
  third_augment: "2test_third_augment",
  companion_id: 2,
  traits_id: 2,
  units_id: 2,
)
#------------------------------------------------------------------------------------------
SummonerInfo.create!(
  puuid: "3test_puuid",
  region: "3test_region",
  tier: "3test_tier",
  rank: "3test_rank",
  league_points: 3,
  riot_summoner_id: "3test_summoner_id",
  summoner_name: "3test_summoner_name",
  wins: 3,
  losses: 3,
  profile_icon_id: 3,
)

Match.create!(
  data_version: "3test_data_version",
  riot_match_id: "3test_riot_match_id",
  game_datetime: 3,
  game_length: 3.3,
  game_version: "3test_game_version",
  queu_id: 3,
  tft_game_type: "3test_tft_game_type",
  tft_set_core_name: "3test_tft_set_core_name",
  tft_set_number: 3,
)

MatchSummonerPerformance.create!(
  match_id: 3,
  summoner_info_id: 3,
  riot_match_id: "3test_riot_match_id",
  puuid: "3test_puuid",
  gold_left: 3,
  last_round: 3,
  level: 3,
  placement: 3,
  players_eliminated: 3,
  time_eliminated: 3.3,
  total_damage_to_players: 3,
  first_augment: "3test_first_augment",
  second_augment: "3test_second_augment",
  third_augment: "3test_third_augment",
  companion_id: 3,
  traits_id: 3,
  units_id: 3,
)
#------------------------------------------------------------------------------------------Another Match for Player 1
Match.create!(
  data_version: "4test_data_version",
  riot_match_id: "4test_riot_match_id",
  game_datetime: 4,
  game_length: 4.4,
  game_version: "4test_game_version",
  queu_id: 4,
  tft_game_type: "4test_tft_game_type",
  tft_set_core_name: "4test_tft_set_core_name",
  tft_set_number: 4,
)

MatchSummonerPerformance.create!(
  match_id: 4,
  summoner_info_id: 1,
  riot_match_id: "test_riot_match_id",
  puuid: "4test_puuid",
  gold_left: 4,
  last_round: 4,
  level: 4,
  placement: 4,
  players_eliminated: 4,
  time_eliminated: 4.4,
  total_damage_to_players: 4,
  first_augment: "4test_first_augment",
  second_augment: "4test_second_augment",
  third_augment: "4test_third_augment",
  companion_id: 4,
  traits_id: 4,
  units_id: 4,
)

Trait.create!(
  id: 111,
  name: "name111",
  num_units: 111,
  style: 111,
  tier_current: 111,
  tier_total: 111,
)

Unit.create!(
  id: 111,
  character_id_name: "character_id_name",
  item_names: ["item_names1","item_names2"],
  name: "name",
  rarity: 111,
  tier: 111,
)

PerformanceTrait.create(
  trait_id: 111,
  match_summoner_performance_id: 1,
)

PerformanceUnit.create(
  unit_id: 111,
  match_summoner_performance_id: 1,
)