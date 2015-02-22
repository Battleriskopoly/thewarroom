class Change < ActiveRecord::Migration
  def change
    create_table :battle do |t|

      t.string :kind
      t.integer :user_one_id
      t.integer :user_two_id
      t.integer :game_id

      t.timestamps

	remove_column :pieces, :chess_id
	add_column :pieces, :battle_id, :integer
    end
  end
end
