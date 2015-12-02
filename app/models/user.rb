class User < ActiveRecord::Base
  has_secure_password

  has_many :bid_histories
  has_many :items, through: :bid_histories

  def active_bids
    self.items.active.uniq
  end

  def last_bid(item)
    item = Item.find(item.id)
    last_bid = BidHistory.where(item_id: item).order("created_at desc").first
    last_bid.bid_amount
  end
end
