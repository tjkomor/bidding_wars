class CategoriesController < ApplicationController
  def show
    @category = find_category
  end

  private

  def find_category
    Category.find_by(slug: params[:category])
  end
end
