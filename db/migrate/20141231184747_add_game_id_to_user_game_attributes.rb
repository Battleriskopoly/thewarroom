class AddGameIdToUserGameAttributes < ActiveRecord::Migration
  def change
		add_column :user_game_attributes, :game_id, :integer
  end
end
