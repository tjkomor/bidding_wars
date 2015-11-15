class User < ActiveRecord::Base
  has_many :addresses
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true
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
