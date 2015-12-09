class AddressesController < ApplicationController
  def edit
    @address = current_user.addresses.first
  end

  def update
    user = find_user
    @address = user.addresses.find(params[:id])
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

  def find_user
    User.find(params[:user_id])
  end
end
