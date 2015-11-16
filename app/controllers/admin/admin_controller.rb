class Admin::AdminController < Admin::BaseController
  before_action :set_rentals

  def show
  end

  def completed
  end

  def ordered
  end

  def cancelled
  end

  def paid
  end

  private

  def set_rentals
    @rentals = Rental.all
  end

end
