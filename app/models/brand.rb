class Brand < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :items

  def self.brand_items(id)
    Item.joins(:brand).where(brand_id: id)
  end
end
