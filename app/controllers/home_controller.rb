class HomeController < ApplicationController
  def index
    @items = active_items
  end
end
