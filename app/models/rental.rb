class Rental < ActiveRecord::Base
  belongs_to :user
  has_many :rental_items
  has_many :items, through: :rental_items
  validates :user_id, :days_rented, :total_price, presence: true

  default_scope -> { order('created_at DESC') }
end
