class UpdateLegsAndTradesAndActiveDateOnLocations < ActiveRecord::Migration
  def change
	add_column :locations, :start_date, :datetime
	remove_column :trades, :sending_location_type
	remove_column :trades, :recipient_location_type
	remove_column :legs, :location_type
  end
end
