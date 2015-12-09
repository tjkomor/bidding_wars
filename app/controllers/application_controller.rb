class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :categories, :stores, :current_user, :store_admin?, :platform_admin?, :active_items

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
      if current_user_role.nil?
      else
        roles = current_user.roles
        name = roles.last.name
        name == "store_admin"
      end
    end
  end

  def platform_admin?
    if current_user
      if current_user_role.nil?
      else
        roles = current_user.roles
        name = roles.last.name
        name == "platform_admin"
      end
    end
  end


  private

  def active_items
    Item.where(active: true).all.select do |item|
      item.is_open
    end
  end

  def user_role_object
    Role.where(name: 'user').first
  end

  def store_admin_role_object
    Role.where(name: 'store_admin').first
  end

  def platform_admin_role_object
    Role.where(name: 'platform_admin').first
  end

  def current_user_role
    roles = current_user.roles
    roles.last
  end
end
