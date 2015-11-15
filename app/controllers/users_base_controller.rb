class UsersBaseController < ApplicationController

  def require_user
    if current_user
      render file: 'public/404' unless current_user.id == params[:user_id].to_i
    else
      render file: 'public/404'
    end
  end
end
