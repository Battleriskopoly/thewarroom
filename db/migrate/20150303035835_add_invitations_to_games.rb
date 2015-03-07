class AddInvitationsToGames < ActiveRecord::Migration
  def change
	add_column :games, :invitation, :string
  end
end
