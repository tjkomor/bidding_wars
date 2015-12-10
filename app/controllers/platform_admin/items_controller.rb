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

        redirect_to platform_admin_store_path(id: find_store_slug)
    else
      flash.now[:error] = @item.errors.full_messages.first.gsub("can't", "cannot")
      render :new
    end
  end

  def edit
    @item = Item.find(params[:format])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      @item.set_permissions
      flash[:notice] = "Item Updated!"
      redirect_to platform_admin_items_path(format: @item.store.slug)
    else
      flash[:error] = @item.errors.full_messages.first.gsub("can't", "cannot")
      redirect_to platform_admin_items_path
    end

  end

private

  def find_store_slug
    Store.find(@item.store_id).slug
  end

  def find_store
    Store.find_by(slug: params[:format])
  end

  def item_params
    params.require(:item).permit(:name, :description, :current_bid, :image_url, :store_id, :category_id, :auction_length, :cancelled, :active)
  end

end
