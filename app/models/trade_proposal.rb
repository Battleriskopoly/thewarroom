class TradeProposal < ActiveRecord::Base
	belongs_to :fort
	belongs_to :user
	belongs_to :trade
	belongs_to :game
end
