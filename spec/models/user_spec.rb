require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with username and password" do
    user_one = User.create(username: 'rossedfort', password: 'password')
    expect(user_one).to be_valid
  end
  it "is invalid without username" do
    user = User.new(password: 'password')
    expect(user).to be_invalid
  end
  it "is invalid without password" do
    user = User.new(username: 'rossedfort')
    expect(user).to be_invalid
  end
  it "is invalid with duplicate username" do
    user_one = User.create(username: 'rossedfort', password: 'password')
    user_two = User.new(username: 'rossedfort', password: 'adifferentpassword')
    expect(user_one).to be_valid
    expect(user_two).to be_invalid
  end
end
