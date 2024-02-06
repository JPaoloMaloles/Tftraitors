class UnitsController < ApplicationController
  def show
    @unit = Unit.find_by(id: params["id"])
    render :show
  end

  def index
    @units = Unit.all
    render :index
  end

  def create
    @unit = Unit.create(
      character_id_name: params["character_id_name"],
      item_names: params["item_names"],
      name: params["name"],
      rarity: params["rarity"],
      tier: params["tier"],
    )
    render :show
  end

  def update
    @unit = Unit.find_by(id: params["id"])
    @unit.update(
      character_id_name: params["character_id_name"] || @unit.character_id_name,
      item_names: params["item_names"] || @unit.item_names,
      name: params["name"] || @unit.name,
      rarity: params["rarity"] || @unit.rarity,
      tier: params["tier"] || @unit.tier,
    )
    render :show
  end

  def destroy
    unit = Unit.find_by(id: params["id"])
    unit.destroy
    render json: {message: "unit has been destroyed"}
  end
end
