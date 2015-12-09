require 'rails_helper'

RSpec.describe Store, type: :model do
  create_roles
  it "can have two admins" do
    store_admin = User.create(username: 'admin', password: 'admin', first_name: 'John', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
    store_admin.roles.clear << Role.where(name: 'store_admin').first
    store = store_admin.stores.create(name: "Waldo's", status: true)

    store_admin_two = User.create(username: 'mike', password: 'admin', first_name: 'Mike', last_name: 'Smith', email_address: 'johnsmith@gmail.com', phone_number: '555-234-5678')
    store_admin_two.roles.clear << Role.where(name: 'store_admin').first

    store.users << store_admin_two

    expect(store.users.first.first_name).to eq("John")
    expect(store.users.last.first_name).to eq("Mike")
    expect(store.users.count).to eq(2)

  end
end
