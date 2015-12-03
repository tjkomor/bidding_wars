class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :categories, :stores, :current_user, :store_admin?, :active_items

  def set_bid_tracker
    @bid_tracker = ActiveBids.new(session[:active_bids])
  end

  def categories
    Category.all
  end

  def stores
    Store.all
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def store_admin?
    if current_user
      roles = current_user.roles
      name = roles.last.name
      name == "store_admin"
    end
  end

  def active_items
    Item.where(active: true).all
  end
end
