class PlatformAdmin::OrdersController < PlatformAdmin::BaseController
  def index
    @store = Store.find_by(slug: params[:format])
  end

  def new
    @order = Order.new(order_params)
  end

  def create
    @store = Store.find(params[:store_id])
    @store.orders.create!(item_id: params[:item_id], user_id: find_winning_bid_user, amount: winning_bid_amount)
    find_item.update(active: false)
    redirect_to platform_admin_orders_path(@store)
  end

  def pending
    @store = Store.find_by(slug: params[:format])
  end

  private

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
