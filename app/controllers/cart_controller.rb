class CartController < ApplicationController
  helper_method :cart_items?

  def index
    if cart_items?
      @user = current_user
      @items = @cart.contents
    else
      flash.now[:error] = "Cart is empty. Please add items."
      render :index
    end
  end

  def cart_items?
    session[:cart] ? true : false
  end

end
