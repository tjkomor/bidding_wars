class Item < ActiveRecord::Base
  validates :name, :price, :description, :image_url, presence: true
  belongs_to :category
end
