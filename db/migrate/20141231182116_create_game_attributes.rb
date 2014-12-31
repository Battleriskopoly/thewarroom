class CreateGameAttributes < ActiveRecord::Migration
  def change
	drop_table :game_attributes
    create_table :game_attributes do |t|

      t.timestamps
    end
  end
end
