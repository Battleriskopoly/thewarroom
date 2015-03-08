class ReplaceTypeWithSomethingFuck < ActiveRecord::Migration
  def change
	add_column :locations, :kindType, :string
  end
end
