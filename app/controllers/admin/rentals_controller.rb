class Admin::RentalsController < Admin::BaseController
  def show
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(status: params[:status])
    flash[:notice] = "Status Updated for Rental #{@rental.id}"
    redirect_to :back
  end
end
