class Admin::DashboardController < Admin::BaseController
  def show
    @admin_dash = true
    @store = Store.where(user_id: current_user.id).first
    if @store.nil?
      redirect_to new_admin_store_path
    else
      @orders = @store.orders
      @customers = @store.customers
    end
  end

  def customers
    store = Store.where(user_id: current_user.id).first
    @customers = store.customers
  end
end
