class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :categories, :stores, :current_user, :current_admin?, :active_items

  def set_cart
    @cart = Cart.new(session[:cart])
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

  def current_admin?
    current_user && current_user.admin?
  end

  def active_items
    Item.where(active: true).all
  end
end
