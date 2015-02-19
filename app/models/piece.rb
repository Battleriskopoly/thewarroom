class Piece < ActiveRecord::Base
	belongs_to :user
	belongs_to :battle
	belongs_to :game
end
