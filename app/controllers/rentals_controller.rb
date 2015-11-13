class RentalsController < UsersBaseController
  before_action :require_user
  helper_method :most_recent_rental

  def index
    if current_user
      @rentals = current_user.rentals
    else
      redirect_to root_path
    end
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      @cart.contents.each do |item|
        RentalItem.create(item_id: item.id, rental_id: @rental.id, quantity: @cart.quantity_of(item.id))
      end
      flash[:notice] = "Order was successfully placed"
      redirect_to user_rentals_path(@user)
      session.delete(:cart)
    else
      flash.now[:error] = "Please submit a valid order"
      render cart_path
    end
  end

  def show
    @rental = current_user.rentals.find(params[:id])
  end

  private

  def rental_params
    {user_id: session[:user_id], days_rented: session[:cart]['days'], total_price: @cart.total_price, status: 'order placed'}
  end
end
