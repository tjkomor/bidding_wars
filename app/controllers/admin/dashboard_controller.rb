class Admin::DashboardController < Admin::BaseController
  def show
    @admin_dash = true
    @user = current_user
  end
end
