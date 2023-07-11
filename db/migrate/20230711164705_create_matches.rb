class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :data_version
      t.string :riot_match_id
      t.integer :game_datetime
      t.float :game_length
      t.string :game_version
      t.integer :queu_id
      t.string :tft_game_type
      t.string :tft_set_core_name
      t.integer :tft_set_number

      t.timestamps
    end
  end
end
