class RenameBidHistory < ActiveRecord::Migration
  def change
    rename_table :bid_history, :bid_histories
  end
end
