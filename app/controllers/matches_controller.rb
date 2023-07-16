class MatchesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  require "http"

  def show
    @match = Match.find_by(id: params["id"])
    render :show
  end

  def index
    @matches = Match.all
    render :index
  end

  def create
    @match = Match.create(
      data_version: params["data_version"],
      riot_match_id: params["riot_match_id"],
      game_datetime: params["game_datetime"],
      game_length: params["game_length"],
      game_version: params["game_version"],
      queu_id: params["queu_id"],
      tft_game_type: params["tft_game_type"],
      tft_set_core_name: params["tft_set_core_name"],
      tft_set_number: params["tft_set_number"],
    )
    render :show
  end

  def update
    @match = Match.find_by(id: params["id"])
    @match.update(
      data_version: params["data_version"] || @match.data_version,
      riot_match_id: params["riot_match_id"] || @match.riot_match_id,
      game_datetime: params["game_datetime"] || @match.game_datetime,
      game_length: params["game_length"] || @match.game_length,
      game_version: params["game_version"] || @match.game_version,
      queu_id: params["queu_id"] || @match.queu_id,
      tft_game_type: params["tft_game_type"] || @match.tft_game_type,
      tft_set_core_name: params["tft_set_core_name"] || @match.tft_set_core_name,
      tft_set_number: params["tft_set_number"] || @match.tft_set_number,
    )
    render :show
  end

  def destroy
    match = Match.find_by(id: params["id"])
    match.destroy
    render json: { message: "Match is destroyed" }
  end

  def riot_second
    p "tftRegion is: #{params["tftRegion"]}"
    p "puuid is: #{params["puuid"]}"

    #Finds Match IDS
    api_data = HTTP.get("https://#{params["tftRegion"]}.api.riotgames.com/tft/match/v1/matches/by-puuid/#{params["puuid"]}/ids?start=0&count=20&api_key=#{ENV["RIOT_API_KEY"]}")
    matches = api_data.parse(:json)
    puts
    puts "Match ID's --------------------------------------------------------------------------------------------------------------------"
    puts
    pp matches
    puts

    render json: { tftRegion: params["tftRegion"], riot_match_ids: matches, summonerInfo_id: params["summonerInfo_id"] }

    # #returns
    # :an_unnamed_list_of_strings
  end

  def riot_third
    p "tftRegion: #{params["params"]["tftRegion"]}"
    p "riot_match_id: #{params["params"]["riot_match_id"]}"
    p "summonerInfo_id: #{params["params"]["summonerInfo_id"]}"
    single_match = false

    api_data = HTTP.get("https://#{params["params"]["tftRegion"]}.api.riotgames.com/tft/match/v1/matches/#{params["params"]["riot_match_id"]}?api_key=#{ENV["RIOT_API_KEY"]}")
    single_match = api_data.parse(:json)

    if single_match
      @match = Match.create(
        data_version: single_match["metadata"]["data_version"],
        riot_match_id: single_match["metadata"]["match_id"],
        game_datetime: single_match["info"]["game_datetime"],
        game_length: single_match["info"]["game_length"],
        game_version: single_match["info"]["game_version"],
        queu_id: single_match["info"]["queue_id"],
        tft_game_type: single_match["info"]["tft_game_type"],
        tft_set_core_name: single_match["info"]["tft_set_core_name"],
        tft_set_number: single_match["info"]["tft_set_number"],
      )
      render :show
    else
      render json: { message: "unable to retrieve match" }
    end
  end
end
