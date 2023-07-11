class MatchesController < ApplicationController
  def show
    @match = Match.find_by(id: params["id"])
    render :show
  end

  def index
    @matches = Match.all
    render :index
  end
end
