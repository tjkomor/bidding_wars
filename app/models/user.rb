class User < ActiveRecord::Base
  has_secure_password

  has_many :bid_histories
  has_many :items, through: :bid_histories
  has_many :user_roles
  has_many :roles, through: :user_roles

  def platform_admin?
   roles.exists?(name: "platform_admin")
 end

   def store_admin?
     roles.exists?(name: "store_admin")
   end

   def registered_user?
     roles.exists?(name: “registered_user”)
   end

  def active_bids
    self.items.active.uniq
  end

  def last_bid(item)
    item = Item.find(item.id)
    last_bid = BidHistory.where(item_id: item, user_id: self.id).order("created_at desc").first
    last_bid.bid_amount
  end
end
