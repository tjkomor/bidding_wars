class PlatformAdmin::StoresController < PlatformAdmin::BaseController
  def index
    @stores = Store.all
  end

  def show
    @store = Store.find_by(slug: params[:id])
    @user = @store.user
    @created = @store.created_at.strftime('%B %d, %Y')
  end
end
