class ReplaceIntValuesWithStringsGameAttributes < ActiveRecord::Migration
  def change
	remove_column :game_attributes, :food_units
	remove_column :game_attributes, :energy_units
	remove_column :game_attributes, :money
	remove_column :game_attributes, :population
	remove_column :game_attributes, :militants
	add_column :game_attributes, :food_units, :string
	add_column :game_attributes, :energy_units, :string
	add_column :game_attributes, :money, :string
	add_column :game_attributes, :population, :string
	add_column :game_attributes, :militants, :string
  end
end
