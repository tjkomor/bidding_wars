class Admin::StoresController < Admin::BaseController
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save

      # @store.status = true
      # @store.user_id = current_user.id
      flash[:notice] = "New Store Created!"
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = @store.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :user_id, :status)
  end
end
