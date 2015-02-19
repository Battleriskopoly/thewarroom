class Game < ActiveRecord::Base
	has_many :users
	accepts_nested_attributes_for :users
	has_many :forts
	has_many :encampments
	has_many :trades
    has_many :trade_proposals
	has_many :battles
	has_many :pieces
end
