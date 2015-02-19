class AddLocationToPieces < ActiveRecord::Migration
  def change
	add_column :pieces, :coordinates, :string
  end
end
