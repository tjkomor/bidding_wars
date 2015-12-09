class PlatformAdmin::StoresController < PlatformAdmin::BaseController
  def index
    @stores = Store.all
  end

  def show
    @store = find_store
    @user = @store.user
    @created = @store.created_at.strftime('%B %d, %Y')
  end

  def update
    store = update_store
    store.activate
    redirect_to platform_admin_store_path(store)
  end

  private

  def update_store
    Store.find_by(id: params[:id])
  end

  def find_store
    Store.find_by(slug: params[:id])
  end
end
