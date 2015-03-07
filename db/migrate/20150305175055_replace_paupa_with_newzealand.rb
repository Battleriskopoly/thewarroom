class ReplacePaupaWithNewzealand < ActiveRecord::Migration
  def change
	remove_column :games, :papua_new_guinea_owner_id
	add_column :games, :new_zealand_owner_id, :integer
  end
end
