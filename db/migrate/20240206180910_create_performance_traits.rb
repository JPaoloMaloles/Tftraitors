class CreatePerformanceTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :performance_traits do |t|
      t.integer :trait_id
      t.integer :match_summoner_performance_id

      t.timestamps
    end
  end
end
