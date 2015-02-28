class AddTimeAndStatusToGames < ActiveRecord::Migration
  def change
	add_column :games, :start_date, :string
	add_column :games, :start_status, :boolean
  end
end
