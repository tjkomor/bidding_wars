class BrandsController < ApplicationController
  def show
    @brand = Brand.find(params[:id])
    @items = Brand.brand_items(params[:id])
  end
end
