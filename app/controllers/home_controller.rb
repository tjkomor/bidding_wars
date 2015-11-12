class HomeController < ApplicationController
  def index
    @new_items = Item.new_arrivals.available
  end
end
