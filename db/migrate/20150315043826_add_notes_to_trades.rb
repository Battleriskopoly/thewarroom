class AddNotesToTrades < ActiveRecord::Migration
  def change
	add_column :trades, :notes, :text
  end
end
