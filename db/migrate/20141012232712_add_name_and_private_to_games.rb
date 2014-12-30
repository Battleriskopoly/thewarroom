class AddNameAndPrivateToGames < ActiveRecord::Migration
  def change
	add_column :games, :name, :string
	add_column :games, :private, :string
  end
end
