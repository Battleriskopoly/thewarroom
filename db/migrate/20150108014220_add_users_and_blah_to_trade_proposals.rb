class AddUsersAndBlahToTradeProposals < ActiveRecord::Migration
  def change
	drop_table :trade_proposals
	remove_column :trades, :seding_fort_id
	remove_column :trades, :recipient_fort_id
	add_column :trades, :sending_location_id, :integer
	add_column :trades, :recipient_location_id, :integer
	add_column :trades, :sending_location_type, :string
	add_column :trades, :recipient_location_type, :string
  end
end
