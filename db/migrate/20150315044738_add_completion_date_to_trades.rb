class AddCompletionDateToTrades < ActiveRecord::Migration
  def change
	add_column :trades, :completion_date, :datetime
  end
end
