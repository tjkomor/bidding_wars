class RenameActiveBids < ActiveRecord::Migration
  def change
    rename_table :active_bids, :bid_history
  end
end
