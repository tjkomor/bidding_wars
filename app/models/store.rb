class Store < ActiveRecord::Base
  before_save :set_slug
  belongs_to :user
  has_many :items

  def to_param
    slug
  end

  def set_slug
    self.slug = name.parameterize
  end

  def store_active_items
    self.items.where(active: true).all.select do |item|
      item.is_open
    end
  end
end
