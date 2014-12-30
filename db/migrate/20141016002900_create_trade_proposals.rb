class CreateTradeProposals < ActiveRecord::Migration
  def change
    create_table :trade_proposals do |t|
      t.integer :fort_id
      t.integer :user_id
      t.integer :recipient_user_id
      t.integer :recipient_fort_id
      t.string :what
      t.integer :quantity
      t.integer :trade_id

      t.timestamps
    end
  end
end
