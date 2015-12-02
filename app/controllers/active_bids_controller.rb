class ActiveBidsController < ApplicationController
  before_action :set_item, only: [:create, :destroy, :update]

  def create
    @bid_tracker.add_item(@item.id)
    session[:cart] = @bid_tracker.items
    flash[:notice] = "#{@item.name} Added to Tracker!"
    redirect_to :back
  end

  def destroy
    @bid_tracker.remove_item(@item.id)
    session[:bid_tracker] = @bid_tracker.items
    flash[:notice] = "Successfully removed <a href='items/#{@item.id}'>#{@item.name}</a> from your tracker."
    session.delete(:cart) if @cart.items.keys.count == 1
    redirect_to cart_path
  end

  def update
    @bid_tracker.update_item(@item.id, params[:quantity])
    redirect_to :back
  end

  def quantity
    @bid_tracker.update_number_of_days(params[:days])
    redirect_to :back
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
