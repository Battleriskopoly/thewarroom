class RemoveMoneyColumnsFromGameAttribute < ActiveRecord::Migration
  def change
	remove_column :game_attributes, :energy_units
	remove_column :game_attributes, :food_units
	remove_column :game_attributes, :population
	remove_column :game_attributes, :militants
	remove_column :game_attributes, :money
  end
end
