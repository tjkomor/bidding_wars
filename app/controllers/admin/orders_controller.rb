class Admin::OrdersController < Admin::BaseController
  def index
    @store = find_store
  end

  def new
    @order = Order.new(order_params)
  end

  def create
    @store = find_store
    @store.orders.create!(item_id: params[:item_id], user_id: find_winning_bid_user, amount: winning_bid_amount)
    find_item.update(active: false)
    redirect_to admin_orders_path
  end

  def pending
    @store = Store.where(user_id: current_user.id).first
  end

  private

  def find_store
    Store.where(user_id: current_user.id).first
  end

  def order_params
    params.require(:order).permit(:store_id, :user_id, :amount, :item_id)
  end

  def find_item
    Item.find(params[:item_id])
  end

  def find_winning_bid_user
    find_item.winning_bid.first.user_id
  end

  def winning_bid_amount
    Item.find(params[:item_id]).winning_bid.first.bid_amount
  end

end
