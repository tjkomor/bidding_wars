class CartItemsController < ApplicationController
  before_action :set_item, only: [:create, :destroy, :update]

  def create
    @cart.add_item(@item.id)
    session[:cart] = @cart.items
    flash[:notice] = "#{@item.name} Added to Cart!"
    redirect_to :back
  end

  def destroy
    @cart.remove_item(@item.id)
    session[:cart] = @cart.items
    flash[:notice] = "Successfully removed <a href='items/#{@item.id}'>#{@item.name}</a> from your cart."
    session.delete(:cart) if @cart.items.keys.count == 1
    redirect_to cart_path
  end

  def update
    @cart.update_item(@item.id, params[:quantity])
    redirect_to :back
  end

  def quantity
    @cart.update_number_of_days(params[:days])
    redirect_to :back
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
