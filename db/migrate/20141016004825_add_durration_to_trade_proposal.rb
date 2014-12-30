class AddDurrationToTradeProposal < ActiveRecord::Migration
  def change
	add_column :trade_proposals, :durration, :string
  end
end
