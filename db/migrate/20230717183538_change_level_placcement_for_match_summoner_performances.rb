class ChangeLevelPlaccementForMatchSummonerPerformances < ActiveRecord::Migration[7.0]
  def change
    rename_column :match_summoner_performances, :level_placement, :placement
    add_column :match_summoner_performances, :level, :integer
  end
end
