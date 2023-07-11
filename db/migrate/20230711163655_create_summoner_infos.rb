class CreateSummonerInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :summoner_infos do |t|
      t.string :puuid
      t.string :tier
      t.string :rank
      t.integer :league_points
      t.string :riot_summoner_id
      t.string :summoner_name
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
