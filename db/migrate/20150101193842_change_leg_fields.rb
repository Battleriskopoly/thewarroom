class ChangeLegFields < ActiveRecord::Migration
  def change
	remove_column :legs, :sending_fort_id
	remove_column :legs, :recipient_fort_id
	remove_column :legs, :sending_user_id
	remove_column :legs, :recipient_user_id
	add_column :legs, :sending_location_id, :integer
	add_column :legs, :recipient_location_id, :integer
	add_column :legs, :sending_location_type, :string
	add_column :legs, :recipient_location_type, :string
  end
end
