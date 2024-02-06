class PerformanceUnitsController < ApplicationController
  def show
    @performance_unit = PerformanceUnit.find_by(id: params["id"])
    render :show
  end

  def index
    @performance_units = PerformanceUnit.all
    render :index
  end

  def create
    @performance_unit = PerformanceUnit.create(
      unit_id: params["unit_id"],
      match_summoner_performance_id: params["match_summoner_performance_id"],
    )
    render :show
  end

  def update
    @performance_unit = PerformanceUnit.find_by(id: params["id"])
    @performance_unit.update(
      unit_id: params["unit_id"] || @performance_unit.unit_id,
      match_summoner_performance_id: params["match_summoner_performance_id"] || @performance_unit.match_summoner_performance_id,
    )
    render :show
  end
  
  def destroy
    performance_unit = PerformanceUnit.find_by(id: params["id"])
    performance_unit.destroy
    render json: {message: "performance_unit was destroyed"}
  end
end
