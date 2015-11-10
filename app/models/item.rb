class Item < ActiveRecord::Base
  validates :name, :price, :description, presence: true
  belongs_to :category
end
