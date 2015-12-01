require 'rails_helper'

RSpec.describe "User" do
  create_user
  feature "Login" do
    it "can log in" do
      skip
    end

    it "cannot log in with invalid credentials" do
      skip
    end
  end
end
