class Admin::CategoriesController < Admin::BaseController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "New Category Created!"
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = @category.erorrs.full_messages.join(", ")
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
