class HomeController < ApplicationController
  def index
    @new_items = Item.new_arivals.available
  end
end
