class Rental < ActiveRecord::Base
  belongs_to :user
  has_many :rental_items
  has_many :items, through: :rental_items
  validates :user_id, :days_rented, :total_price, presence: true

  default_scope -> { order('created_at DESC') }
  scope :completed, -> { where(status: 'Completed') }
  scope :ordered, -> { where(status: 'Ordered') }
  scope :paid, -> { where(status: 'Paid') }
  scope :out, -> { where(status: 'Out') }
  scope :cancelled, -> { where(status: 'Cancelled') }

  def total_per_day
    (self.total_price / self.days_rented)
  end

  def calculated_price(days)
    total_per_day * days
  end

  def extend_rental(days, total)
    days  = days.to_i + self.days_rented
    total = total.to_i + self.total_price
    self.update(days_rented: days, total_price: total)
  end
end
