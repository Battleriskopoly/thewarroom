class CreateChess < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
	t.string :type
	t.string :location
	t.integer :chess_id
	t.integer :user_id
    end
  end
end
