class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :message
      t.boolean :accept_status

      t.timestamps
    end
  end
end
