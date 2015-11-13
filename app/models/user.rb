class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :rentals
  has_secure_password

  def recent_rental
    if self.rentals.empty?
      false
    else
      self.rentals.last.items
    end
  end
end
