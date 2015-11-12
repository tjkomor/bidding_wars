class RentalsController < ApplicationController
  helper_method :most_recent_rental

  def index
    if current_user
      @rentals = current_user.rentals
    else
      redirect_to root_path
    end
  end

  def create
    find_items
    calculate_total_price(@items)
    @user = User.find(session[:user_id])
    @rental = Rental.new(rental_params)
    if @rental.save
      flash[:notice] = "Order was successfully placed"
      redirect_to user_rentals_path(@user)
    else
      flash.now[:error] = "Please submit a valid order"
      render cart_path
    end
  end

  def show
    @rental = current_user.rentals.find(params[:id])
  end

  private

  def most_recent_rental
    if session[:cart]
      find_items
    else
      {}
    end
  end

  def find_items
    item_ids = session[:cart].keys.map { |key| key.to_i }
    @items = Item.where(id: item_ids)
  end

  def calculate_total_price(items)
    item_prices = items.map { |item| item.price * session[:cart].fetch(item.id.to_s) }
    price_per_day = item_prices.reduce(:+)
    @total_price = (price_per_day * session[:cart]['days'])
  end

  def rental_params
    {user_id: session[:user_id], days_rented: session[:cart]['days'], total_price: @total_price}
  end
end
