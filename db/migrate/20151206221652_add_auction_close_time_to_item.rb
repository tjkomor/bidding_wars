class AddAuctionCloseTimeToItem < ActiveRecord::Migration
  def change
    add_column :items, :auction_close_time, :datetime
  end
end
