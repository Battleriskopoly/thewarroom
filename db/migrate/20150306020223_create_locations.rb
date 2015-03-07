class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :type
      t.integer :game_id
      t.integer :user_id
      t.string :territory
      t.integer :food_units
      t.integer :energy_units
      t.integer :money
      t.integer :militants
      t.integer :population
      t.integer :xco
      t.integer :yco
      t.datetime :active_date

      t.timestamps
    end
  end
end
