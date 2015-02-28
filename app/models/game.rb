class Game < ActiveRecord::Base
	belongs_to :user
	has_many :game_attributes
	has_many :forts
	has_many :encampments
	has_many :trades
   	has_many :trade_proposals
	has_many :battles
	has_many :pieces
end
