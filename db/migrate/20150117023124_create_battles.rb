class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :user_one_id
      t.integer :user_two_id
      t.integer :game_id
      t.string :battle_type

      t.timestamps
    end
  end
end
