class AddTraitsAndUnitsToMatchSummonerPerformance < ActiveRecord::Migration[7.0]
  def change
    add_column :match_summoner_performances, :traits, :text, array: true, default: []
    add_column :match_summoner_performances, :units, :text, array: true, default: []
  end
end
