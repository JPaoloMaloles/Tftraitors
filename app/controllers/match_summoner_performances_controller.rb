class MatchSummonerPerformancesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :riot_fourth]

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

  def riot_fourth
    require "http"
    p "tftRegion: #{params["params"]["tftRegion"]}"
    p "riot_match_id: #{params["params"]["riot_match_id"]}"
    p "summonerInfo_id: #{params["params"]["summonerInfo_id"]}"
    p "match_id: #{params["params"]["match_id"]}"

    single_match = false

    # api_data = HTTP.get("https://#{params["params"]["tftRegion"]}.api.riotgames.com/tft/match/v1/matches/#{params["params"]["riot_match_id"]}?api_key=#{ENV["RIOT_API_KEY"]}")
    api_data = HTTP.get("https://#{params["params"]["tftRegion"]}.api.riotgames.com/tft/match/v1/matches/#{params["params"]["riot_match_id"]}?api_key=#{ENV["RIOT_API_KEY"]}")
    single_match = api_data.parse(:json)

    # single_match["info"]
    # render json: single_match["info"]["participants"]

    single_match["info"]["participants"].each do |participant|
      @match_summoner_performance = MatchSummonerPerformance.create(
        match_id: params["params"]["match_id"],
        summoner_info_id: params["params"]["summonerInfo_id"],
        riot_match_id: single_match["metadata"]["match_id"],
        puuid: participant["puuid"],
        gold_left: participant["gold_left"],
        last_round: participant["last_round"],
        level_placement: participant["placement"],
        players_eliminated: participant["players_eliminated"],
        time_eliminated: participant["time_eliminated"],
        total_damage_to_players: participant["total_damage_to_players"],
        first_augment: participant["augments"][0] || "none",
        second_augment: participant["augments"][1] || "none",
        third_augment: participant["augments"][2] || "none",
        companion_id: participant["companion_id"] || "TBA",
      )
    end
    @match_summoner_performances = MatchSummonerPerformance.where(match_id: params["params"]["match_id"])
    render :index

    # if single_match
    # @match_summoner_performance = MatchSummonerPerformance.create(
    #   match_id: params["params"]["match_id"],
    #   summoner_info_id: params["params"]["summonerInfo_id"],
    #   riot_match_id: "a",
    #   puuid: "a",
    #   gold_left: "a",
    #   last_round: "a",
    #   level_placement: "a",
    #   players_eliminated: "a",
    #   time_eliminated: "a",
    #   total_damage_to_players: "a",
    #   first_augment: "a",
    #   second_augment: "a",
    #   third_augment: "a",
    #   companion_id: "a",
    # )
    # render :show
    # else
    #   render json: { message: "unable to retrieve MatchSummonerPerformance" }
    # end
  end
end
