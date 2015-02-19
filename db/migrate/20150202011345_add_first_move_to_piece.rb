class AddFirstMoveToPiece < ActiveRecord::Migration
  def change
	add_column :pieces, :first_move, :booleene
  end
end
