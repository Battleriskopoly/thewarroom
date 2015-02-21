class RemoveTabels < ActiveRecord::Migration
  def change
	drop_table :senders
	drop_table :recipients
  end
end
