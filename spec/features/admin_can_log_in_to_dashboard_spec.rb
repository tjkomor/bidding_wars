
#       As an unregistered user
#       When I visit "/admin/dashboard"
#       I get a 404

RSpec.describe 'Admin', type: :feature do
  feature 'admin' do
    it 'can log in and view dashboard page' do
      admin = User.create(username: "tyler",
                          password: 'password',
                          role: 1 )

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_dashboard_path

    assert page.has_content?("Admin Dashboard")
    end
  end
end
