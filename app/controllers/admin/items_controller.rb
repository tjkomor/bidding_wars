class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item Created!"
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = @item.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image_url, :brand_id, :category_id)
  end
end
