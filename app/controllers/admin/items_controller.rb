class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    binding.pry
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image)
  end
end
