class ChangeTradeCostFromIntToFloat < ActiveRecord::Migration
  def change
	remove_column :trades, :cost
	add_column :trades, :cost, :float
  end
end
