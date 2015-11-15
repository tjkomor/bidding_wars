class AddressesController < ApplicationController
  def edit
    @addresses = current_user.addresses
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "Address Updated!"
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:line_one, :line_two, :city, :state, :zip, :country, :user_id)
  end
end
