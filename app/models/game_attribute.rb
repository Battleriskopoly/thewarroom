class GameAttribute < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
  	validates :color, presence: true
end
