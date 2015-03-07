class ReplaceUserGameWithGameAttributesFix < ActiveRecord::Migration
  def change
	remove_column :users, :game_attribute_id
	add_column :users, :game_id, :integer
  end
end
