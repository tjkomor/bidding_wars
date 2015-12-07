class Admin::DashboardController < Admin::BaseController
  def show
    @admin_dash = true
    @user = current_user
    @store = Store.where(user_id: @user.id).first
    if @store.nil?
      redirect_to new_admin_store_path
    else
      @items = @store.items
      @orders = @store.store_past_items
      winning_customers = @orders.map do |order|
        BidHistory.where(item_id: order.id).where(bid_amount: order.winning_bid).first
      end
      @customers = winning_customers
    end
  end

  def customers
  end
end
