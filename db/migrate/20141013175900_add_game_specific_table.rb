class AddGameSpecificTable < ActiveRecord::Migration
  def change
	create_table :game_attributes do |t|
      t.integer :color
	  t.belongs_to :user
	  t.belongs_to :game
	end
  end
end
