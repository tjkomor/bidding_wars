class Store < ActiveRecord::Base
  before_save :set_slug
  belongs_to :user
  has_many :items
  has_many :orders

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
end
