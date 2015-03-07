class ChangeUsercentricToGameAttributeCentric < ActiveRecord::Migration
  def change
	drop_table :encampments
	drop_table :forts
  end
end
