require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with username and password" do
    user_one = User.create(username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024')
    expect(user_one).to be_valid
  end
  it "is invalid without username" do
    user = User.new(password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024')
    expect(user).to be_invalid
  end
  it "is invalid without password" do
    user = User.new(username: 'rossedfort', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024')
    expect(user).to be_invalid
  end
  it "is invalid without first name" do
    user = User.new(username: 'rossedfort', password: 'password', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024')
    expect(user).to be_invalid
  end
  it "is invalid without last name" do
    user = User.new(username: 'rossedfort', password: 'password', first_name: 'Ross', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024')
    expect(user).to be_invalid
  end
  it "is invalid without email address" do
    user = User.new(username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', phone_number: '908-698-9024')
    expect(user).to be_invalid
  end
  it "is invalid without phone number" do
    user = User.new(username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com')
    expect(user).to be_invalid
  end
  it "is invalid with duplicate username" do
    user_one = User.create(username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024')
    user_two = User.new(username: 'rossedfort', password: 'password', first_name: 'Blah', last_name: 'Blah', email_address: 'blahblah@yahoo.com', phone_number: '111-111-1111')
    expect(user_one).to be_valid
    expect(user_two).to be_invalid
  end
end


# username: 'rossedfort', password: 'password', first_name: 'Ross', last_name: 'Edfort', email_address: 'rossedfort@yahoo.com', phone_number: '908-698-9024'
