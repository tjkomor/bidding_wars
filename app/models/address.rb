class Address < ActiveRecord::Base
  belongs_to :user

  validates :line_one, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :country, presence: true
  validates :user_id, presence: true

  def formatted_address
    "#{line_one} \n #{line_two} \n #{city} #{state}, #{zip} #{country} "
  end
end
