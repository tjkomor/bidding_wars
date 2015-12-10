class PlatformAdmin::UsersController < PlatformAdmin::BaseController
  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      @new_user.roles << Role.where(name: 'store_admin').first
      @new_user.stores << Store.where(slug: params[:format]).first
      redirect_to platform_admin_store_path(@new_user.stores.first)
    else
      flash.now[:error] = @new_user.errors.full_messages.first.gsub("can't", "cannot")
      render :new
    end
  end

  private

  def user_params
    params.require(:info).permit(:username, :password, :first_name, :last_name, :email_address, :phone_number, :active, :image, :bio)
  end
end
