class Admin::BrandsController < Admin::BaseController
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:notice] = "New Brand Created!"
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = @brand.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
