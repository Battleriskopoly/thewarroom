class AddTypeToBattle < ActiveRecord::Migration
  def change
	add_column :battles, :type, :string
  end
end
