class AddThingsToThingsBlah < ActiveRecord::Migration
  def change
	add_column :battles, :pending, :boolean 
  end
end
