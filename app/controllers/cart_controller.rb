class CartController < ApplicationController
  helper_method :cart_items?

  def index
    if cart_items?
      find_items
      calculate_total_price(@items)
    else
      flash[:error] = "Cart is empty. Please add items."
      render :cart_error
    end
  end

  def cart_items?
    session[:cart] ? true : false

  end

  def find_items
    item_ids = session[:cart].keys.map { |key| key.to_i }
    @items = Item.where(id: item_ids)
  end

  def calculate_total_price(items)
    item_prices = items.map { |item| item.price * session[:cart].fetch(item.id.to_s) }
    price_per_day = item_prices.reduce(:+)
    @total_price = (price_per_day * @cart.number_of_days)
  end

end
