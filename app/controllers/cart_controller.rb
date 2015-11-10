class CartController < ApplicationController
  helper_method :cart_items?

  def index
    if cart_items?
      item_ids = session[:cart].keys.map { |key| key.to_i }
      @items = Item.where(id: item_ids)
      @total_price = @items.map { |item| item.price * session[:cart].fetch(item.id.to_s) }.reduce(:+)
    else
      flash[:error] = "Cart is empty. Please add items."
      redirect_to :back
    end
  end

  def cart_items?
    session[:cart] ? true : false
  end

end
