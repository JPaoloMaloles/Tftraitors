class SummonerInfosController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show, :show_profile, :riot_first]

  def show
    @summoner_info = SummonerInfo.find_by(id: params["id"])
    render :show
  end

  def show_profile
    @summoner_info = SummonerInfo.where(region: params["region"]).find_by(summoner_name: params["summoner_name"])
    render :show
  end

  def index
    @summoner_infos = SummonerInfo.all
    render :index
  end

  def create
    @summoner_info = SummonerInfo.create(
      puuid: params["puuid"],
      region: params["region"],
      tier: params["tier"],
      rank: params["rank"],
      league_points: params["league_points"],
      riot_summoner_id: params["riot_summoner_id"],
      summoner_name: params["summoner_name"],
      wins: params["wins"],
      losses: params["losses"],
      profile_icon_id: params["profile_icon_id"],
    )
    render :show
  end

  def update
    @summoner_info = SummonerInfo.find_by(id: params["id"])
    @summoner_info.update(
      puuid: params["puuid"] || @summoner_info.puuid,
      region: params["region"] || @summoner_info.region,
      tier: params["tier"] || @summoner_info.tier,
      rank: params["rank"] || @summoner_info.rank,
      league_points: params["league_points"] || @summoner_info.league_points,
      riot_summoner_id: params["riot_summoner_id"] || @summoner_info.riot_summoner_id,
      summoner_name: params["summoner_name"] || @summoner_info.summoner_name,
      wins: params["wins"] || @summoner_info.wins,
      losses: params["losses"] || @summoner_info.losses,
      profile_icon_id: params["profile_icon_id"] || @summoner_info.profile_icon_id,
    )
    render :show
  end

  def destroy
    summoner_info = SummonerInfo.find_by(id: params["id"])
    summoner_info.destroy
    render json: { message: "Summoner Info was Destroyed" }
  end

  def riot_create
    require "http"
    region = "na1"
    tft_region = "americas"
    #https://{regionAbbv}.api.riotgames.com/{path}?{api_key}

    #What happens when a user's profile is update, acquires all that summoner's info based on summoner_name and region.

    #Finds player information based on Summoner Name (name displayed in client)
    api_data = HTTP.get("https://#{region}.api.riotgames.com/tft/summoner/v1/summoners/by-name/#{ENV["SUMMONER_NAME"]}?api_key=#{ENV["RIOT_API_KEY"]}")
    summoner_information = api_data.parse(:json)
    puts
    puts "Summoner Information --------------------------------------------------------------------------------------------------------------------"
    puts
    pp summoner_information

    puuid = summoner_information["puuid"]
    p puuid

    summoner_id = summoner_information["id"]
    puts "SUMMONER ID"
    pp summoner_id
    puts

    api_data = HTTP.get("https://na1.api.riotgames.com/tft/league/v1/entries/by-summoner/#{summoner_id}?api_key=#{ENV["RIOT_API_KEY"]}")
    profile_information = api_data.parse(:json)
    puts
    puts "Profile Information --------------------------------------------------------------------------------------------------------------------"
    puts
    pp profile_information
    # #returns
    # :queuType
    # :tier
    # :rank
    # :leaguePoints
    # :summonerID
    # :summonerName
    # :wins
    # :losses
    # :veteran
    # :inactive
    # :freshBlood
    # :hotStreak

    p "tier is"
    p profile_information[0]["tier"]

    @summoner_info = SummonerInfo.create(
      puuid: puuid,
      region: region,
      tier: profile_information[0]["tier"],
      rank: profile_information[0]["rank"],
      league_points: profile_information[0]["leaguePoints"],
      riot_summoner_id: summoner_id,
      summoner_name: profile_information[0]["summonerName"],
      wins: profile_information[0]["wins"],
      losses: profile_information[0]["losses"],
      profile_icon_id: profile_information[0]["profileIconId"],
    )

    render :show
  end

  def riot_first
    require "http"
    p "region is: #{params["region"]}"
    p "summoner name is: #{params["summonerName"]}"
    tagline = params["tagline"] || "NA1"
    tft_region = {
      "BR1" => "americas",
      "EUN1" => "europe",
      "EUW1" => "europe",
      "JP1" => "asia",
      "KR" => "asia",
      "LA1" => "americas",
      "LA2" => "americas",
      "NA1" => "americas",
      "OC1" => "sea",
      "PH2" => "sea",
      "RU" => "europe",
      "SG2" => "sea",
      "TH2" => "sea",
      "TR1" => "europe",
      "TW2" => "sea",
      "VN2" => "sea",
    }
    #https://{regionAbbv}.api.riotgames.com/{path}?{api_key}

    #What happens when a user's profile is update, acquires all that summoner's info based on summoner_name and region.

    #Finds player information based on Summoner Name (name displayed in client)
    # api_data = HTTP.get("https://#{params["region"]}.api.riotgames.com/tft/summoner/v1/summoners/by-name/#{params["summonerName"]}?api_key=#{ENV["RIOT_API_KEY"]}")
    puts "tft_region is #{tft_region["NA1"]}"
    puts "https://#{tft_region[params["region"]]}.api.riotgames.com/riot/account/v1/accounts/by-riot-id/#{params["summonerName"]}/NA1?api_key=#{ENV["RIOT_API_KEY"]}"
    #CHANGE NA1 to tagline
    puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
    api_data = HTTP.get("https://#{tft_region[params["region"]]}.api.riotgames.com/riot/account/v1/accounts/by-riot-id/#{params["summonerName"]}/#{tagline}?api_key=#{ENV["RIOT_API_KEY"]}")
    summoner_information = api_data.parse(:json)
    puts
    puts "Summoner Information --------------------------------------------------------------------------------------------------------------------"
    puts
    pp summoner_information

    puuid = summoner_information["puuid"]
    p puuid

    game_name = summoner_information["gameName"]
    p game_name

    #Acuiring encryped SummonerID
    puts "##################"
    puts "aaa#{params["region"].downcase}"
    puts "https://#{params["region"].downcase}.api.riotgames.com/tft/summoner/v1/summoners/by-puuid/#{puuid}?api_key=#{ENV["RIOT_API_KEY"]}"
    puts "##################"
    api_data = HTTP.get("https://#{params["region"]}.api.riotgames.com/tft/summoner/v1/summoners/by-puuid/#{puuid}?api_key=#{ENV["RIOT_API_KEY"]}")
    summoner_information = api_data.parse(:json)

    summoner_id = summoner_information["id"]
    puts "SUMMONER ID"
    pp summoner_id
    puts

    profile_icon_id = summoner_information["profileIconId"]

    api_data = HTTP.get("https://#{params["region"]}.api.riotgames.com/tft/league/v1/entries/by-summoner/#{summoner_id}?api_key=#{ENV["RIOT_API_KEY"]}")
    profile_information = api_data.parse(:json)
    puts
    puts "Profile Information --------------------------------------------------------------------------------------------------------------------"
    puts
    if profile_information != []
      pp profile_information
      # #returns
      # :queuType
      # :tier
      # :rank
      # :leaguePoints
      # :summonerID
      # :summonerName
      # :wins
      # :losses
      # :veteran
      # :inactive
      # :freshBlood
      # :hotStreak

      p "tier is"
      p profile_information[0]["tier"]

      @summoner_info = SummonerInfo.create(
        puuid: puuid,
        region: params["region"],
        tier: profile_information[0]["tier"],
        rank: profile_information[0]["rank"],
        league_points: profile_information[0]["leaguePoints"],
        riot_summoner_id: summoner_id,
        summoner_name: game_name,
        wins: profile_information[0]["wins"],
        losses: profile_information[0]["losses"],
        profile_icon_id: profile_icon_id,
      )
    else
      @summoner_info = SummonerInfo.create(
        puuid: puuid,
        region: params["region"],
        tier: "blank",
        rank: "blank",
        league_points: "blank",
        riot_summoner_id: summoner_id,
        summoner_name: params["summonerName"],
        wins: "blank",
        losses: "blank",
        profile_icon_id: profile_icon_id,
      )
    end
    render :show
  end
end
