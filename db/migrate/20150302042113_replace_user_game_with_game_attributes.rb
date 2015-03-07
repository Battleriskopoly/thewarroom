class ReplaceUserGameWithGameAttributes < ActiveRecord::Migration
  def change
	remove_column :users, :game_id
	add_column :users, :game_attribute_id, :integer
  end
end
