class BidHistoriesController < ApplicationController

  def create
    @bid = BidHistory.new(bid_params)
    if @bid.save
      item = Item.where(id: params[:bid_history][:item_id]).all
      item.first.increment_bid(params[:bid_history][:bid_amount])
      flash[:notice] = "You have successfully bid $#{item.first.bid_histories.last.bid_amount} on #{item.first.name}!"
      redirect_to :back
    else
      flash.now[:error] = @item.errors.full_messages.first.gsub("can't", "cannot")
      render :new
    end
  end

  private

  def bid_params
    params.require(:bid_history).permit(:bid_amount, :user_id, :item_id)
  end
end
