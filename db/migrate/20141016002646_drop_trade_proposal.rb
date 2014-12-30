class DropTradeProposal < ActiveRecord::Migration
  def change
	drop_table :trade_proposal
  end
end
