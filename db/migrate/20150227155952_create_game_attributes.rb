class CreateGameAttributes < ActiveRecord::Migration
  def change
    create_table :game_attributes do |t|
      t.integer :game_id
      t.integer :user_id
      t.string :color
      t.integer :militants
      t.integer :money
      t.integer :population
      t.integer :energy_units
      t.integer :food_units

      t.timestamps
    end
  end
end
