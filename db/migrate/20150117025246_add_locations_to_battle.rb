class AddLocationsToBattle < ActiveRecord::Migration
  def change
	add_column :battles, :location_one_id, :integer
	add_column :battles, :location_one_type, :string
	add_column :battles, :location_two_id, :integer
	add_column :battles, :location_two_type, :string
  end
end
