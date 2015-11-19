class Admin::DashboardController < Admin::BaseController
  def show
    @admin_dash = true
    @rentals = Rental.all
  end
end
