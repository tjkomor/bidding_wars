class BidHistoriesController < ApplicationController

  def create
    @bid = BidHistory.new(bid_params)
    if @bid.save
      item = Item.where(id: params[:item_id]).all
      item.first.increment_bid
      redirect_to :back
    else
      flash.now[:error] = @item.errors.full_messages.first.gsub("can't", "cannot")
      render :new
    end
  end

  private

  def bid_params
    params.permit(:bid_amount, :user_id, :item_id)
  end
end
