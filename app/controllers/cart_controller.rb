class CartController < ApplicationController

  def index
    item_ids = session[:cart].keys.map { |key| key.to_i }
    @items = Item.where(id: item_ids)
    @total_price = @items.map { |item| item.price * session[:cart].fetch(item.id.to_s) }.reduce(:+)
  end

end
