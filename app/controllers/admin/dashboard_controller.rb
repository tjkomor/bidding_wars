class Admin::DashboardController < Admin::BaseController
  def show
    @admin_dash = true
    @store = Store.where(user_id: current_user.id).first
    if @store.nil?
      redirect_to new_admin_store_path
    else
      @orders = @store.orders
      # winning_customers = @orders.map do |order|
      #   BidHistory.where(item_id: order.item_id).where(bid_amount: order.item.winning_bid).first
      # end
      @customers = @store.customers
    end
  end

  def customers
    store = Store.where(user_id: current_user.id).first
    @customers = store.customers
    # store.orders.map{|order| [User.find(order.user_id), order.item.name]}
  end
end
