class AddAugmentsAndCompanionIdToMatchSummonerPerformance < ActiveRecord::Migration[7.0]
  def change
    add_column :match_summoner_performances, :first_augment, :string
    add_column :match_summoner_performances, :second_augment, :string
    add_column :match_summoner_performances, :third_augment, :string
    add_column :match_summoner_performances, :companion_id, :integer
  end
end
