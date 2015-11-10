class CartItemsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    # binding.pry
    session[:cart] = @cart.items
    flash[:notice] = "#{item.name} Added to Cart!"
    render :index
  end

  def index

  end
end
