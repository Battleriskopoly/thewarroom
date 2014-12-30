class AddWhatAndQuantityToTrades < ActiveRecord::Migration
  def change
	add_column :trades, :what, :string
	add_column :trades, :quantity, :integer
  end
end
