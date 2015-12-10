require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to(:store) }
  it { should belong_to(:user) }
  it { should belong_to(:item) }
end
