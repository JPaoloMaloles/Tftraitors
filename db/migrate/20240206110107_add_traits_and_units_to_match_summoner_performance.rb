class AddTraitsIdAndUnitsIdToMatchSummonerPerformance < ActiveRecord::Migration[7.0]
  def change
    add_column :match_summoner_performances, :traits_id, :integer
    add_column :match_summoner_performances, :units_id, :integer
  end
end
