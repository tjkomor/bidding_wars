class RentalItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  validates :item_id, :rental_id, :quantity, presence: true
end
