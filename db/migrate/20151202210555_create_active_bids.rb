class CreateActiveBids < ActiveRecord::Migration
  def change
    create_table :active_bids do |t|
      t.references :user, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :bid_amount

      t.timestamps null: false
    end
  end
end
