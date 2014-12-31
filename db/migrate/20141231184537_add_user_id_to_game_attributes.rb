class AddUserIdToGameAttributes < ActiveRecord::Migration
  def change
	add_column :user_game_attributes, :user_id, :integer
  end
end
