class Battle < ActiveRecord::Base
	belongs_to :user
	has_many :pieces
end
