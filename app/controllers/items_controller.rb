class ItemsController < ApplicationController
  def index
    @items = Item.available
  end

  def show
    @item = Item.find(params[:id])
  end
end
