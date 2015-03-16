class ReplaceIntsWithStrings < ActiveRecord::Migration
  def change
	remove_column :locations, :food_units
	remove_column :locations, :energy_units
	remove_column :locations, :money
	remove_column :locations, :population
	remove_column :locations, :militants
	add_column :locations, :food_units, :string
	add_column :locations, :energy_units, :string
	add_column :locations, :money, :string
	add_column :locations, :population, :string
	add_column :locations, :militants, :string
  end
end
