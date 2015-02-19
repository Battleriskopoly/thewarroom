class DeletPiecesBlah < ActiveRecord::Migration
  def change
	drop_table :peices
  end
end
