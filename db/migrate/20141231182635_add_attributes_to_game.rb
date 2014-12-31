class AddAttributesToGame < ActiveRecord::Migration
  def change
  def change
    create_table :game_attributes do |t|
      t.integer :game_id
      t.text :color
      t.timestamps
    end
  end
  end
end
