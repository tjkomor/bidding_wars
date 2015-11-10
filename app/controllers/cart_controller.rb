class CartController < ApplicationController

  def index
    @cart_items = session[:cart]
    item_ids = session[:cart].keys.map { |key| key.to_i }
    binding.pry
    @items = Item.where(item_id: item_ids)

  end

end
