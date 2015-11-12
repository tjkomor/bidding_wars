class Item < ActiveRecord::Base
  validates :name, :price, :description, :image_url, presence: true
  belongs_to :category
  belongs_to :brand
  has_many :rental_items
  has_many :rentals, through: :rental_items
  scope :new_arivals, -> { order(created_at: :desc).limit(6) }
end
