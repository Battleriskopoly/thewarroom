class Trade < ActiveRecord::Base
	belongs_to :game
	has_many :legs
  	accepts_nested_attributes_for :legs
	validates :cost, presence: true, numericality: true
	validates :quantity, presence: true, numericality: true
	validates :forquantity, presence: true, numericality: true
	validates :what, presence: true
	validates :forwhat, presence: true
end
