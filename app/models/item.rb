class Item < ActiveRecord::Base
  belongs_to :store
  belongs_to :category

  has_many :bid_histories
  has_many :users, through: :bid_histories

  scope :active, -> { where(active: true) }
end
