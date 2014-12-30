class CreateUserGameAttributes < ActiveRecord::Migration
  def change
    create_table :user_game_attributes do |t|
      t.integer :color

      t.timestamps
    end
  end
end
