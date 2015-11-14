class AdminController < ApplicationController
  before_action :require_admin

  def show
    byebug
    redirect_to admin_dashboard_path
  end

  private

  def require_admin
    render 'public/404' unless current_admin?
  end
end
