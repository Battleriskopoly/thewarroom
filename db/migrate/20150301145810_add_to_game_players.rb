class AddToGamePlayers < ActiveRecord::Migration
  def change
	add_column :games, :players, :integer
  end
end
