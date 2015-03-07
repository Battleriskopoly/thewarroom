class ChangeStartDateToDate < ActiveRecord::Migration
  def change
	remove_column :games, :start_date
	add_column :games, :start_date, :date
  end
end
