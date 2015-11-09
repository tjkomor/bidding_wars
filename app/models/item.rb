class Item < ActiveRecord::Base
  validates :name, :price, :description, presence: true
end
