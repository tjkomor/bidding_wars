class RentalsController < ApplicationController
  def index
    @rentals = current_user.rentals
  end

  def show
    @rental = current_user.rentals.find(params[:id])
  end
end
