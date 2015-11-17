class RentalsController < UsersBaseController
  before_action :require_user
  helper_method :most_recent_rental

  def index
    @rentals = current_user.rentals
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      create_rental_items
      flash[:notice] = "Order was successfully placed"
      session.delete(:cart)
      redirect_to user_rentals_path
    else
      flash.now[:error] = "Please submit a valid order"
      render cart_path
    end
  end

  def show
    @rental = current_user.rentals.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.extend_rental(params[:days], params[:total])
    flash[:notice] = "Successfully Extended Rental"
    redirect_to :back
  end

  private

  def rental_params
    {user_id: session[:user_id], days_rented: session[:cart]['days'], total_price: @cart.total_price, status: 'Ordered'}
  end

  def create_rental_items
    @cart.contents.each do |item|
      RentalItem.create(item_id: item.id, rental_id: @rental.id, quantity: @cart.quantity_of(item.id))
    end
  end

end
