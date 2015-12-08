class UsersController < UsersBaseController
  def new
    @role = params[:role]
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @role = params[:role]
    if @role == 'user'
      if @user.save
        session[:user_id] = @user.id
        @user.roles << Role.where(name: 'user').first
        # @user.addresses.create(address_params)
        redirect_to dashboard_path
      else
        flash.now[:error] = @user.errors.full_messages.first.gsub("can't", "cannot")
        render :new
      end
    elsif @role == 'store_admin'
      if @user.save
        session[:user_id] = @user.id
        @user.roles << Role.where(name: 'store_admin').first
        redirect_to new_admin_store_path
      else
        flash.now[:error] = @user.errors.full_messages.first.gsub("can't", "cannot")
        render :new
      end
    else
      if @user.save
        session[:user_id] = @user.id
        @user.roles << Role.where(name: 'platform_admin').first
        redirect_to platform_admin_dashboard_path
      else
        flash.now[:error] = @user.errors.full_messages.first.gsub("can't", "cannot")
        render :new
      end
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(edit_user_params)
      flash[:notice] = 'User Updated!'
      redirect_to dashboard_path
    else
      flash.now[:errors] = @user.errors.full_messages.first.gsub("can't", "cannot")
      render :edit
    end
  end

  def destroy
    current_user.update_attributes(active: false, password: nil)
    session.delete(:user_id)
    flash[:notice] = "Your account has been deactivated"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:info).permit(:username, :password, :first_name, :last_name, :email_address, :phone_number, :active, :image, :bio)
  end

  def edit_user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :email_address, :phone_number, :active, :image, :bio)
  end

  def address_params
    params.require(:info).permit(:line_one, :line_two, :city, :state, :zip, :country)
  end
end
