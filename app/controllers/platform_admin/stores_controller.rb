class PlatformAdmin::StoresController < PlatformAdmin::BaseController
  def index
    @stores = Store.all
  end

  def show
    @store = find_store
    @user = @store.user
    @created = @store.created_at.strftime('%B %d, %Y')
  end

  def create
    store = create_store
    store.activate
    redirect_to platform_admin_store_path(store)
  end

  private

  def create_store
    Store.find_by(id: params[:format])
  end

  def find_store
    Store.find_by(id: params[:id])
  end
end
