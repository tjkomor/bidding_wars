class AddAuctionLengthToItems < ActiveRecord::Migration
  def change
    add_column :items, :auction_length, :integer
  end
end
