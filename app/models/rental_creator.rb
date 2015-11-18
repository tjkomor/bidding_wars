class RentalCreator
  def self.create_rental(cart, session)
    rental = Rental.create(user_id: session[:user_id], days_rented: session[:cart]['days'], total_price: cart.total_price, status: 'Paid')
    cart.contents.each do |item|
      RentalItem.create(item_id: item.id, rental_id: rental.id, quantity: cart.quantity_of(item.id))
    end
  end
end
