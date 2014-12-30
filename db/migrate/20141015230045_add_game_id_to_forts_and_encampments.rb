class AddGameIdToFortsAndEncampments < ActiveRecord::Migration
  def change
	add_column :forts, :game_id, :integer
	add_column :encampments, :game_id, :integer
	add_column :trades, :game_id, :integer
  end
end
