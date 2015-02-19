class AddFieldsToPieces < ActiveRecord::Migration
  def change
	add_column :pieces, :piece_type, :string
  end
end
