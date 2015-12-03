class ItemsController < ApplicationController
  def index
    @items = active_items
  end

  def show
    @item = Item.find(params[:id])
  end
end
