class AddTurnsToBattle < ActiveRecord::Migration
  def change
	add_column :battles, :turn, :booleene
  end
end
