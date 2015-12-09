class RentalsController < UsersBaseController
  before_action :require_user
  helper_method :most_recent_rental

  def index
    @rentals = current_user.rentals
  end

  def show
    @rental = current_user.rentals.find(params[:id])
  end

  def update
    @rental = find_rental
    @rental.extend_rental(params[:days], params[:total])
    flash[:notice] = "Successfully Extended Rental"
    redirect_to :back
  end

  private

  def find_rental
    Rental.find(params[:id])
  end
end
