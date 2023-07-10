class SummonerInfosController < ApplicationController
  def show
    @summoner_info = SummonerInfo.find_by(id: params["id"])
    render :show
  end

  def index
    @summoner_infos = SummonerInfo.all
    render :index
  end
end
