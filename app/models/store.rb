class Store < ActiveRecord::Base
  before_save :set_slug
  belongs_to :user
  has_many :items
  has_many :orders
  has_many :store_admins
  has_many :users, through: :store_admins


  def to_param
    slug
  end

  def set_slug
    self.slug = name.parameterize
  end

  def store_active_items
    self.items.where(active: true).all.select do |item|
      item.is_open
    end
  end

  def store_past_items
    self.items.select do |item|
      item.time_closed
    end
  end

  def pending_bids
    self.items.select do |item|
      item.time_closed && item.active && !item.winning_bid.empty?
    end
  end

  def customers
    customers = {}
    self.orders.each do |order|
      if !customers.keys.include?(User.find(order.user_id))
        customers[User.find(order.user_id)] = [Item.find(order.item_id)]
      else
        customers[User.find(order.user_id)] << Item.find(order.item_id)
      end
    end
    customers
  end
end
