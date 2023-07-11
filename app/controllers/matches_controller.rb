class MatchesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def show
    @match = Match.find_by(id: params["id"])
    render :show
  end

  def index
    @matches = Match.all
    render :index
  end

  def create
    @match = Match.create(
      data_version: params["data_version"],
      riot_match_id: params["riot_match_id"],
      game_datetime: params["game_datetime"],
      game_length: params["game_length"],
      game_version: params["game_version"],
      queu_id: params["queu_id"],
      tft_game_type: params["tft_game_type"],
      tft_set_core_name: params["tft_set_core_name"],
      tft_set_number: params["tft_set_number"],
    )
    render :show
  end

  def update
    @match = Match.find_by(id: params["id"])
    @match.update(
      data_version: params["data_version"] || @match.data_version,
      riot_match_id: params["riot_match_id"] || @match.riot_match_id,
      game_datetime: params["game_datetime"] || @match.game_datetime,
      game_length: params["game_length"] || @match.game_length,
      game_version: params["game_version"] || @match.game_version,
      queu_id: params["queu_id"] || @match.queu_id,
      tft_game_type: params["tft_game_type"] || @match.tft_game_type,
      tft_set_core_name: params["tft_set_core_name"] || @match.tft_set_core_name,
      tft_set_number: params["tft_set_number"] || @match.tft_set_number,
    )
    render :show
  end

  def destroy
    match = Match.find_by(id: params["id"])
    match.destroy
    render json: { message: "Match is destroyed" }
  end
end
