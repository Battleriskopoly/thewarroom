class ReplaceTypeWithSomething < ActiveRecord::Migration
  def change
	remove_column :locations, :type

  end
end
