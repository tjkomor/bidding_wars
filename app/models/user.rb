class User < ActiveRecord::Base
  has_secure_password
  validates :password, presence: true
  validates :email_address, presence: true
  validates :phone_number, presence: true
  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :username, presence: true
  # validates :username, presence: true

  has_many :bid_histories
  has_many :items, through: :bid_histories

  def active_bids
    self.items.active.uniq
  end

  def last_bid(item)
    item = Item.find(item.id)
    last_bid = BidHistory.where(item_id: item, user_id: self.id).order("created_at desc").first
    last_bid.bid_amount
  end
end
