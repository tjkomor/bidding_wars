class Admin::StoresController < Admin::BaseController
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      @store.store_admins.create(user_id: current_user.id, store_id: @store.id)
      flash[:notice] = "New Store Created!"
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = @store.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @store = current_user.stores.first
  end

  def update
    @store = current_user.stores.first
    if @store.update(store_params)
      flash[:notice] = "Store Name Updated!"
      redirect_to admin_dashboard_path
    else
      flash[:error] = @store.errors.full_messages.first.gsub("can't", "cannot")
      redirect_to admin_store_path
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :user_id, :status)
  end
end
