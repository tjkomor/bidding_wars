class Admin::AdminController < Admin::BaseController

  def show
    @rentals = Rental.all
  end

end
