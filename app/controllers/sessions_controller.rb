class SessionsController < ApplicationController
  def create
  @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if current_admin?
        redirect_to admin_dashboard_path
      elsif @user.active
        redirect_to dashboard_path
      else
        render :activation, locals: {user: @user}
      end
    else
      flash.now[:error] = "Invalid Credentials"
      render :new
    end
  end

  def new
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  # def activation
  #   @user = User.find(params[:id])
  #   render :activation
  # end
end
