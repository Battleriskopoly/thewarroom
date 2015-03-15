class AddAcceptedStatusToTrade < ActiveRecord::Migration
  def change
	add_column :trades, :accepted_status, :boolean
	add_column :notifications, :action, :string
  end
end
