class Admin::AdminController < Admin::BaseController

  def show
    @rentals = Rental.all
    @count = Rental.all
  end

  def completed
    @rentals = Rental.completed
    @count = Rental.all
    render :show
  end

  def ordered
    @rentals = Rental.ordered
    @count = Rental.all
    render :show
  end

  def cancelled
    @rentals = Rental.in_progress
    @count = Rental.all
    render :show
  end

  def paid
    @rentals = Rental.paid
    @count = Rental.all
    render :show
  end

end
