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
  end
  
  def update
  end

  def destroy
    trait = Trait.find_by(id: params["id"])
    trait.destroy
    render json: {message: "trait has been destroyed"}
  end
end
