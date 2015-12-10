class PlatformAdmin::DashboardController < PlatformAdmin::BaseController
  def show
  end

  def customers
    store = Store.find_by(slug: params[:format])
    @customers = store.customers
  end
end
