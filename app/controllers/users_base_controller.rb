class UsersBaseController < ApplicationController

  def require_user
    render 'public/404' unless current_user
  end
end
