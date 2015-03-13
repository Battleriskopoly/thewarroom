class Location < ActiveRecord::Base
	belongs_to :game
	belongs_to :user
	has_many :trades
  	validates :xco, presence: true, numericality: { only_integer: true }
	validates :yco, presence: true, numericality: { only_integer: true }
	validates :territory, presence: true
	validates :name, presence: true
end  	
