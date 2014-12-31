class ChangeColorDataTypeInUserGameAttributes < ActiveRecord::Migration
  def change
remove_column :user_game_attributes, :color
add_column :user_game_attributes, :color, :string
  end
end
