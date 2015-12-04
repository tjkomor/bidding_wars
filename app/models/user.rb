class User < ActiveRecord::Base
  has_secure_password

  # before_save :set_default_role

  has_many :bid_histories
  has_many :items, through: :bid_histories
  has_many :user_roles
  has_many :roles, through: :user_roles


  def set_default_role
    roles << Role.find_by(name: "user")
  end

  def platform_admin?
    roles.first.name == "platform_admin"
  end

  def store_admin?
    roles.first.name == "store_admin"
  end

  def registered_user?
    roles.first.name == "user"
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
