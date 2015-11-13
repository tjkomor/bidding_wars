class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
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
end
