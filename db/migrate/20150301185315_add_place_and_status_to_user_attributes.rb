class AddPlaceAndStatusToUserAttributes < ActiveRecord::Migration
  def change
	add_column :game_attributes, :status, :boolean
	add_column :game_attributes, :place, :integer
  end
end
