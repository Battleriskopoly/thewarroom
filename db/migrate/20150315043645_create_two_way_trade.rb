class CreateTwoWayTrade < ActiveRecord::Migration
  def change
	add_column :trades, :forwhat, :string
	add_column :trades, :forquantity, :integer
  end
end
