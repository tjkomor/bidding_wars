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

  def destroy
    item = Item.find(params[:id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.items
    # flash[:notice] = "Successfully removed #{link_to(item.name, item_path(item))} from your cart."
    flash[:notice] = "Successfully removed <a href='items/#{item.id}'>#{item.name}</a> from your cart."
    redirect_to cart_path
  end

  def update
    if params[:quantity]
      item = Item.find(params[:id])
      @cart.update_item(item.id, params[:quantity])
      redirect_to :back
    elsif params[:days]
      @cart.update_number_of_days(params[:days])
      redirect_to :back
    end
  end

end
