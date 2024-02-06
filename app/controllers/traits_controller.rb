class TraitsController < ApplicationController
  def show
    @trait = Trait.find_by(id: params["id"])
    render :show
  end

  def index
    @traits = Trait.all
    render :index
  end

  def create
    @trait = Trait.create(
      name: params["name"],
      num_units: params["num_units"],
      style: params["style"],
      tier_current: params["tier_current"],
      tier_total: params["tier_total"],
    )
    render :show
  end
  
  def update
    @trait = Trait.find_by(id: params["id"])
    @trait.update(
      name: params["name"] || @trait.name,
      num_units: params["num_units"] || @trait.num_units,
      style: params["style"] || @trait.style,
      tier_current: params["tier_current"] || @trait.tier_current,
      tier_total: params["tier_total"] || @trait.tier_total,
    )
    render :show
  end

  def destroy
    trait = Trait.find_by(id: params["id"])
    trait.destroy
    render json: {message: "trait has been destroyed"}
  end
end
