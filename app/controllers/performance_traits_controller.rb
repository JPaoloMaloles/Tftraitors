class PerformanceTraitsController < ApplicationController
  def show
    @performance_trait = PerformanceTrait.find_by(id: params["id"])
    render :show
  end

  def index
    @performance_traits = PerformanceTrait.all
    render :index
  end

  def create
    @performance_trait = PerformanceTrait.create(
      trait_id: params["trait_id"],
      match_summoner_performance_id: params["match_summoner_performance_id"],
    )
    render :show
  end
  
  def update
    @performance_trait = PerformanceTrait.find_by(id: params["id"])
    @performance_trait.update(
      trait_id: params["trait_id"] || @performance_trait.trait_id,
      match_summoner_performance_id: params["match_summoner_performance_id"] || @performance_trait.match_summoner_performance_id,
    )
    render :show
  end

  def destroy
    performance_trait = PerformanceTrait.find_by(id: params["id"])
    performance_trait.destroy
    render json: {message: "performance_trait has been destroyed"}
  end
end
