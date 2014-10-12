class RemoveAndEditColumsOfLegs < ActiveRecord::Migration
  def change
	remove_column :legs, :fort_id
	add_column :legs, :recipient_fort_id, :integer
	add_column :legs, :sending_fort_id, :integer
	add_column :legs, :trade_id, :integer
  end
end
