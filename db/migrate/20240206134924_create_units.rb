class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.string :character_id_name
      t.string :item_names, array: true, default: []
      t.string :name
      t.integer :rarity
      t.integer :tier

      t.timestamps
    end
  end
end
