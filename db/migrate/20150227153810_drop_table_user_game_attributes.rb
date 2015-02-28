class DropTableUserGameAttributes < ActiveRecord::Migration
  def change
	drop_table :user_game_attributes
  end
end
