class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :items

  def to_param
    name
  end
end
