class MatchSummonerPerformancesController < ApplicationController
  def show
    @match_summoner_performance = MatchSummonerPerformance.find_by(id: params["id"])
    render :show
  end

  def index
    @match_summoner_performances = MatchSummonerPerformance.all
    render :index
  end

  def create
  end

  def update
  end

  def destroy
  end
end
