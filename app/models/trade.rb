class Trade < ActiveRecord::Base
	belongs_to :location
	belongs_to :user
	belongs_to :game
	has_many :legs
  	accepts_nested_attributes_for :legs
	has_one :trade_proposal
end
