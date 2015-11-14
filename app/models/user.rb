class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :rentals

  enum role: %w(default admin)

  def recent_rental
    self.rentals.last.items
  end
end
