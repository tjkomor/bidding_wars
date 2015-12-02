class Item < ActiveRecord::Base
  belongs_to :store
  belongs_to :category

  scope :active, -> { where(active: true) }
end
