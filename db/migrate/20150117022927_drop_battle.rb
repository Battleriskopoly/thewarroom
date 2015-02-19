class DropBattle < ActiveRecord::Migration
  def change
	drop_table :battle
  end
end
