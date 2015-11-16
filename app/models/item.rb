class Item < ActiveRecord::Base
  validates :name, :price, :description, :image_url, presence: true
  belongs_to :category
  belongs_to :brand
  has_many :rental_items
  has_many :rentals, through: :rental_items

  scope :available, -> { where(retired: false) }
  scope :new_arrivals, -> { order(created_at: :desc).limit(6) }

  def quantity_of_rental_item(rental_id)
    self.rental_items.find_by(rental_id: rental_id).quantity
  end

  def subtotal_of_rental_item(rental)
    self.price * rental.days_rented * quantity_of_rental_item(rental.id).to_i
  end
end
