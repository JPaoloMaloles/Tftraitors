class SummonerInfosController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def show
    @summoner_info = SummonerInfo.find_by(id: params["id"])
    render :show
  end

  def index
    @summoner_infos = SummonerInfo.all
    render :index
  end

  def create
    @summoner_info = SummonerInfo.create(
      puuid: params["puuid"],
      tier: params["tier"],
      rank: params["rank"],
      league_points: params["league_points"],
      riot_summoner_id: params["riot_summoner_id"],
      summoner_name: params["summoner_name"],
      wins: params["wins"],
      losses: params["losses"],
    )
    render :show
  end

  def update
    @summoner_info = SummonerInfo.find_by(id: params["id"])
    @summoner_info.update(
      puuid: params["puuid"] || @summoner_info.puuid,
      tier: params["tier"] || @summoner_info.tier,
      rank: params["rank"] || @summoner_info.rank,
      league_points: params["league_points"] || @summoner_info.league_points,
      riot_summoner_id: params["riot_summoner_id"] || @summoner_info.riot_summoner_id,
      summoner_name: params["summoner_name"] || @summoner_info.summoner_name,
      wins: params["wins"] || @summoner_info.wins,
      losses: params["losses"] || @summoner_info.losses,
    )
    render :show
  end

  def destroy
    summoner_info = SummonerInfo.find_by(id: params["id"])
    summoner_info.destroy
    render json: { message: "Summoner Info was Destroyed" }
  end
end
