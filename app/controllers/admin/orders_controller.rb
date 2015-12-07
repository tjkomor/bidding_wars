class Admin::OrdersController < Admin::BaseController
  def index
    @store = Store.where(user_id: current_user.id).first
  end

  def new
    @order = Order.new()
  end

  def create
    @store = Store.where(user_id: current_user.id).all.first
    @store.orders.create!(item_id: params[:item_id], user_id: Item.find(params[:item_id]).winning_bid.first.user_id, amount: Item.find(params[:item_id]).winning_bid.first.bid_amount)
    Item.find(params[:item_id]).update(active: false)
    redirect_to admin_orders_path
  end

  def pending
    @store = Store.where(user_id: current_user.id).first
  end

end
