class ChargesController < ApplicationController
  def new
  end

  def create
    @amount = (@cart.total_price * 100)

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  RentalCreator.create_rental(@cart, session)
  flash[:notice] = "Order was successfully placed"
  session.delete(:cart)
  redirect_to user_rentals_path(current_user)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
