class CreateMatchSummonerPerformances < ActiveRecord::Migration[7.0]
  def change
    create_table :match_summoner_performances do |t|
      t.integer :match_id
      t.integer :summoner_info_id
      t.string :riot_match_id
      t.string :puuid
      t.integer :gold_left
      t.integer :last_round
      t.integer :level_placement
      t.integer :players_eliminated
      t.float :time_eliminated
      t.integer :total_damage_to_players

      t.timestamps
    end
  end
end
