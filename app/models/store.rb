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
end
