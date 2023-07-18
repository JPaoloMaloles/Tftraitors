class AddRegionToSummonerInfos < ActiveRecord::Migration[7.0]
  def change
    add_column :summoner_infos, :region, :string
  end
end
