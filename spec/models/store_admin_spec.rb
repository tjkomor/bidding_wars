require 'rails_helper'

RSpec.describe StoreAdmin, type: :model do
  it { should belong_to(:store) }
  it { should belong_to(:user) }
end
