class ItemsController < ApplicationController
  def index
    @items = active_items
  end

  def show
    binding.pry
    @item = find_item
  end

  private

  def find_item
    Item.find(params[:id])
  end
end
