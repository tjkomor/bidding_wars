class BrandsController < ApplicationController
  def show
    @brand = Brand.find(params[:id])
    @items = @brand.items.available
  end
end
