class AddThingsToThingsBlah < ActiveRecord::Migration
  def change
	add_column :battles, :pending, :booleene
  end
end
