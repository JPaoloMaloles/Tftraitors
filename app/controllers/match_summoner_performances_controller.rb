class MatchSummonerPerformancesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def show
    @match_summoner_performance = MatchSummonerPerformance.find_by(id: params["id"])
    render :show
  end

  def index
    @match_summoner_performances = MatchSummonerPerformance.all
    render :index
  end

  def create
    @match_summoner_performance = MatchSummonerPerformance.create(
      match_id: params["match_id"],
      summoner_info_id: params["summoner_info_id"],
      riot_match_id: params["riot_match_id"],
      puuid: params["puuid"],
      gold_left: params["gold_left"],
      last_round: params["last_round"],
      level_placement: params["level_placement"],
      players_eliminated: params["players_eliminated"],
      time_eliminated: params["time_eliminated"],
      total_damage_to_players: params["total_damage_to_players"],
      first_augment: params["first_augment"],
      second_augment: params["second_augment"],
      third_augment: params["third_augment"],
      companion_id: params["companion_id"],
    )
    render :show
  end

  def update
    @match_summoner_performance = MatchSummonerPerformance.find_by(id: params["id"])
    @match_summoner_performance.update(
      match_id: params["match_id"] || @match_summoner_performance.match_id,
      summoner_info_id: params["summoner_info_id"] || @match_summoner_performance.summoner_info_id,
      riot_match_id: params["riot_match_id"] || @match_summoner_performance.riot_match_id,
      puuid: params["puuid"] || @match_summoner_performance.puuid,
      gold_left: params["gold_left"] || @match_summoner_performance.gold_left,
      last_round: params["last_round"] || @match_summoner_performance.last_round,
      level_placement: params["level_placement"] || @match_summoner_performance.level_placement,
      players_eliminated: params["players_eliminated"] || @match_summoner_performance.players_eliminated,
      time_eliminated: params["time_eliminated"] || @match_summoner_performance.time_eliminated,
      total_damage_to_players: params["total_damage_to_players"] || @match_summoner_performance.total_damage_to_players,
      first_augment: params["first_augment"] || @match_summoner_performance.first_augment,
      second_augment: params["second_augment"] || @match_summoner_performance.second_augment,
      third_augment: params["third_augment"] || @match_summoner_performance.third_augment,
      companion_id: params["companion_id"] || @match_summoner_performance.companion_id,
    )
    render :show
  end

  def destroy
    match_summoner_performance = MatchSummonerPerformance.find_by(id: params["id"])
    match_summoner_performance.destroy
    render json: { message: "MatchSummonerPerformance has been destroyed" }
  end
end
