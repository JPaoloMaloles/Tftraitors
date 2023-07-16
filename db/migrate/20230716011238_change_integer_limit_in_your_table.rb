class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[7.0]
  def change
    change_column :matches, :game_datetime, :integer, limit: 8
  end
end
