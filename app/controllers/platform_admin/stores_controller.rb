class PlatformAdmin::StoresController < PlatformAdmin::BaseController
  def index
    @stores = Store.all
  end

  def show
    byebug
    @store = Store.find_by(id: params[:id])
    @user = @store.user
    @created = @store.created_at.strftime('%B %d, %Y')
  end

  def create
    store = Store.find_by(id: params[:format])
    store.activate
    redirect_to platform_admin_store_path(store)
  end
end
