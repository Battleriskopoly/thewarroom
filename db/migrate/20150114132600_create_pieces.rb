class CreatePieces < ActiveRecord::Migration
  def change
      drop_table :pieces
    create_table :pieces do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :chess_id

      t.timestamps
    end
  end
end
