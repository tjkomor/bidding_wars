class Item < ActiveRecord::Base
  belongs_to :store
  belongs_to :category

  has_many :bid_histories
  has_many :users, through: :bid_histories

  scope :active, -> { where(active: true) }
  scope :closed, -> { where(active: false) }


  def increment_bid
    self.update(current_bid: (self.current_bid + 1))
  end

  def winning_bid
    amount = self.bid_histories.maximum(:bid_amount)
    self.bid_histories.where(bid_amount: amount)
  end
end
