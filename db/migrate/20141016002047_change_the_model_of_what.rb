class ChangeTheModelOfWhat < ActiveRecord::Migration
  def change
	remove_column :legs, :what
	remove_column :legs, :quantity
	remove_column :legs, :durration
	create_table :trade_proposal do |t|
      t.integer :user_id
	  t.integer :fort_id
	  t.integer :game_id
	  t.integer :recipient_fort_id
	  t.integer :recipient_user_id
	  t.belongs_to :user
	  t.belongs_to :game
	  t.belongs_to :fort
	end
  end
end
