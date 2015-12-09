class PlatformAdmin::CategoriesController < PlatformAdmin::BaseController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "New Category Created!"
      redirect_to platform_admin_dashboard_path
    else
      flash.now[:error] = @category.errors.full_messages.first.gsub("can't", "cannot")
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
