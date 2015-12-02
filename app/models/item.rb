class Item < ActiveRecord::Base
  belongs_to :store
  belongs_to :category

  has_many :bid_histories
  has_many :users, through: :bid_histories

  scope :active, -> { where(active: true) }

  def increment_bid
    self.update(current_bid: (self.current_bid + 1))
  end
end
