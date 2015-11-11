class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :categories, :brands, :current_user

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def categories
    Category.all
  end

  def brands
    Brand.all
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
