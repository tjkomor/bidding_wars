class PlatformAdmin::StoresController < PlatformAdmin::BaseController
  def index
    @stores = Store.all
  end

  def show
    @store = find_store
  end

  def edit
    @store = find_store
  end

  def update
    @store = find_store
    if @store.update(store_params)
      flash[:notice] = "Store Name Updated!"
      redirect_to platform_admin_store_path(@store)
    else
      flash[:error] = @store.errors.full_messages.first.gsub("can't", "cannot")
      redirect_to redirect_to platform_admin_store_path(@store)
    end
  end

  def status
    @store = Store.find(params[:format])
    @store.check_status
    redirect_to platform_admin_store_path(@store)
  end

  private

  def store_params
    params.require(:store).permit(:name, :user_id, :status)
  end

  def update_store
    Store.find_by(id: params[:id])
  end

  def find_store
    Store.find_by(slug: params[:id])
  end
end
