class CreateTraits < ActiveRecord::Migration[7.0]
  def change
    create_table :traits do |t|
      t.string :name
      t.integer :num_units
      t.integer :style
      t.integer :tier_current
      t.integer :tier_total

      t.timestamps
    end
  end
end
