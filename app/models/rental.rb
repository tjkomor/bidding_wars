class Rental < ActiveRecord::Base
  belongs_to :user
  has_many :rental_items
  has_many :items, through: :rental_items

end
