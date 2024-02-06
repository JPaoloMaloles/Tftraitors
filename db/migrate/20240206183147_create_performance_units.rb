class CreatePerformanceUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :performance_units do |t|
      t.integer :unit_id
      t.integer :match_summoner_performance_id

      t.timestamps
    end
  end
end
