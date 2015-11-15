class UsersController < UsersBaseController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      @user.addresses.create(address_params)
      redirect_to dashboard_path
    else
      flash.now[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:message] = 'User Updated!'
      redirect_to dashboard_path
    else
      flash.now[:errors] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def user_params
    params.require(:info).permit(:username, :password, :first_name, :last_name, :email_address, :phone_number)
  end

  def address_params
    params.require(:info).permit(:line_one, :line_two, :city, :state, :zip, :country)
  end
end
