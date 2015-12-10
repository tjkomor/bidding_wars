class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
  end

  def edit
    @item = find_item
  end

  def update
    @item = find_item
    if @item.update(item_params)
      @item.set_permissions
      flash[:notice] = "Item Updated!"
      redirect_to admin_items_path
    else
      flash[:error] = @item.errors.full_messages.first.gsub("can't", "cannot")
      redirect_to admin_items_path
    end
  end

  def index
    @items = current_user.stores.first.items
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        flash[:notice] = "Item Created!"
        redirect_to admin_dashboard_path
    else
      flash.now[:error] = @item.errors.full_messages.first.gsub("can't", "cannot")
      render :new
    end
  end


  private

  def find_item
    Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :current_bid, :image_url, :store_id, :category_id, :auction_length, :cancelled, :active)
  end
end
