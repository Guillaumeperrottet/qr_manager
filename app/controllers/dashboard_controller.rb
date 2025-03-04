class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @qr_codes = current_user.qr_codes.order(created_at: :desc).limit(5)
    @restaurants = current_user.restaurants.order(created_at: :desc).limit(5)
  end
end
