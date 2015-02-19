class AddLocationTypeToLegsNew < ActiveRecord::Migration
  def change
	add_column :legs, :sending_location_type, :string
	add_column :legs, :recipient_location_type, :string
  end
end
