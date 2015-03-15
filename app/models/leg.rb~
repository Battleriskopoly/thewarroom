class Leg < ActiveRecord::Base
	belongs_to :trades
	validates :trade_index, presence: true, numericality: true
	validates :location_id, presence: true, numericality: true
end
