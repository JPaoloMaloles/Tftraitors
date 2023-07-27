class AddProfileIconIdToSummonerInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :summoner_infos, :profile_icon_id, :integer
  end
end
