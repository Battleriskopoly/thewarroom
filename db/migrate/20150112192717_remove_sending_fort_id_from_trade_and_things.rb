class RemoveSendingFortIdFromTradeAndThings < ActiveRecord::Migration
  def change
	remove_column :trades, :sending_fort_id
  end
end
