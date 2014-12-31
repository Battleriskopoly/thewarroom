class GetAttributesInCheck < ActiveRecord::Migration
  def change
	drop_table :game_attributes
  end
end
