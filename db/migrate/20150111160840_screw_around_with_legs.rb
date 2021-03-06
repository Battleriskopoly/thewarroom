class ScrewAroundWithLegs < ActiveRecord::Migration
  def change
	remove_column :legs, :sending_location_type
	remove_column :legs, :recipient_location_type
	remove_column :legs, :sending_location_id
	remove_column :legs, :recipient_location_id
	add_column :legs, :location_type, :string
	add_column :legs, :location_id, :integer
	add_column :legs, :trade_index, :integer
  end
end
