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
      level: params["level"],
      placement: params["placement"],
      players_eliminated: params["players_eliminated"],
      time_eliminated: params["time_eliminated"],
      total_damage_to_players: params["total_damage_to_players"],
      first_augment: params["first_augment"],
      second_augment: params["second_augment"],
      third_augment: params["third_augment"],
      companion_id: params["companion_id"],
      traits_id: 0,
      units_id: 0,
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
      level: params["placement"] || @match_summoner_performance.level,
      placement: params["placement"] || @match_summoner_performance.placement,
      players_eliminated: params["players_eliminated"] || @match_summoner_performance.players_eliminated,
      time_eliminated: params["time_eliminated"] || @match_summoner_performance.time_eliminated,
      total_damage_to_players: params["total_damage_to_players"] || @match_summoner_performance.total_damage_to_players,
      first_augment: params["first_augment"] || @match_summoner_performance.first_augment,
      second_augment: params["second_augment"] || @match_summoner_performance.second_augment,
      third_augment: params["third_augment"] || @match_summoner_performance.third_augment,
      companion_id: params["companion_id"] || @match_summoner_performance.companion_id,
      traits_id: params["traits_id"] || @match_summoner_performance.traits_id,
      units_id: params["units_id"] || @match_summoner_performance.units_id,
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

    # api_data = HTTP.get("https://americas.api.riotgames.com/tft/match/v1/matches/#{match_id}?api_key=#{ENV["RIOT_API_KEY"]}")
    api_data = HTTP.get("https://#{params["params"]["tftRegion"]}.api.riotgames.com/tft/match/v1/matches/#{params["params"]["riot_match_id"]}?api_key=#{ENV["RIOT_API_KEY"]}")
    single_match = api_data.parse(:json)

    # single_match["info"]
    # render json: single_match["info"]["participants"]

    single_match["info"]["participants"].each do |participant|
      p "@@@@@@@@@@@@@@@@@@@@@@@@@ participant[puuid]: #{participant["puuid"]}, #{params["params"]["puuid"]}"
      if participant["puuid"] == params["params"]["puuid"]
        @match_summoner_performance = MatchSummonerPerformance.create(
          match_id: params["params"]["match_id"],
          summoner_info_id: params["params"]["summonerInfo_id"],
          riot_match_id: single_match["metadata"]["match_id"],
          puuid: participant["puuid"],
          gold_left: participant["gold_left"],
          last_round: participant["last_round"],
          level: participant["level"],
          placement: participant["placement"],
          players_eliminated: participant["players_eliminated"],
          time_eliminated: participant["time_eliminated"],
          total_damage_to_players: participant["total_damage_to_players"],
          first_augment: participant["augments"][0] || "none",
          second_augment: participant["augments"][1] || "none",
          third_augment: participant["augments"][2] || "none",
          companion_id: participant["companion"]["item_ID"] || "TBA",
          traits_id: 0,
          units_id: 0,
        )
        @match_summoner_performance.update(
          first_augment: @match_summoner_performance.parse_augment_image(@match_summoner_performance.first_augment),
          second_augment: @match_summoner_performance.parse_augment_image(@match_summoner_performance.second_augment),
          third_augment: @match_summoner_performance.parse_augment_image(@match_summoner_performance.third_augment),
        )
        participant["traits"].each do |trait|
          @trait = Trait.create(
            name: trait["name"],
            num_units: trait["num_units"],
            style: trait["style"],
            tier_current: trait["tier_current"],
            tier_total: trait["tier_total"],
          )
          PerformanceTrait.create(
            trait_id: @trait.id,
            match_summoner_performance_id: @match_summoner_performance.id,
          )
        end
        participant["units"].each do |unit|
          @unit = Unit.create(
            character_id_name: unit["character_id"],
            item_names: unit["itemNames"],
            name: unit["name"],
            rarity: unit["rarity"],
            tier: unit["tier"],
          )
          PerformanceUnit.create(
            unit_id: @unit.id,
            match_summoner_performance_id: @match_summoner_performance.id,
          )
        end
      end
    end
    @match_summoner_performances = MatchSummonerPerformance.where(match_id: params["params"]["match_id"])
    render :index
  end
end
