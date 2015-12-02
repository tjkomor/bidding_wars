class User < ActiveRecord::Base
  has_secure_password

  has_many :bid_histories
  has_many :items, through: :bid_histories

  def active_bids
    self.items.active
  end
end
