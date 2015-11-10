class CartItemsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.items
    flash[:notice] = "#{item.name} Added to Cart!"
    redirect_to :back
  end

  def index

  end
end
