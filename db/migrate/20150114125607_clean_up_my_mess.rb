class CleanUpMyMess < ActiveRecord::Migration
  def change
	drop_table :chesses
	drop_table :pieces
  end
end
