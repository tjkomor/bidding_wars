class RentalCreator
  def self.create_rental(cart, session)
    phone_number = User.find(session[:user_id]).phone_number
    rental = Rental.create(user_id: session[:user_id], days_rented: session[:cart]['days'], total_price: cart.total_price, status: 'Paid')
    cart.contents.each do |item|
      RentalItem.create(item_id: item.id, rental_id: rental.id, quantity: cart.quantity_of(item.id))
    end
    SendSMS.send_text(phone_number)
  end
end
