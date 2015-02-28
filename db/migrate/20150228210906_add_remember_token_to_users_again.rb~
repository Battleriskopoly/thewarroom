class AddRememberTokenToUsersAgain < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string
    remove_column :users, :remember_digest, :string
  end
end
