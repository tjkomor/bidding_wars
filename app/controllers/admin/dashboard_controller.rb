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
    # store.orders.map{|order| [User.find(order.user_id), order.item.name]}
  end
end
