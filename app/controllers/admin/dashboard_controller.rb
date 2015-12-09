class Admin::DashboardController < Admin::BaseController
  def show
    @admin_dash = true
    @store = current_user.stores.first
    if @store.nil?
      redirect_to new_admin_store_path
    end
  end

  def customers
    store = Store.where(user_id: current_user.id).first
    @customers = store.customers
  end

  private

  def find_store
    Store.where(user_id: current_user.id).first
  end
end
