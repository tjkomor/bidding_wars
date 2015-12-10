class PlatformAdmin::ItemsController < PlatformAdmin::BaseController
  def index
    @items = find_store.items
  end

  def new
    @item = Item.new
    @store = Store.find_by(slug: params[:format])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        flash[:notice] = "Item Created!"

        redirect_to platform_admin_store_path(id: Store.find(@item.store_id).slug)
    else
      flash.now[:error] = @item.errors.full_messages.first.gsub("can't", "cannot")
      render :new
    end
  end

private

  def find_store
    Store.find_by(slug: params[:format])
  end

  def item_params
    params.require(:item).permit(:name, :description, :current_bid, :image_url, :store_id, :category_id, :auction_length, :cancelled, :active)
  end

end
