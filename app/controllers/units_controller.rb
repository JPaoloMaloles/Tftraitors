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
  end

  def update
  end

  def delete
    unit = Unit.find_by(id: params["id"])
    unit.destroy
    render json: {message: "unit has been destroyed"}
  end
end
