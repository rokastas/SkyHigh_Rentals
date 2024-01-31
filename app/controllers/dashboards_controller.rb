class DashboardsController < ApplicationController
  before_action :user_dashboard, only: [:dashboard]

  def dashboard
    # @user = current_user
    # @user_booked_drones = @user.booked_drones.includes(:drone)
  end

  private

  def user_dashboard
    order_options = { 'bookings.user_id' => :asc }
    @all_drones_grouped_by_user = Drone.includes(bookings: :user).order(order_options).group_by { |drone| drone.user }
  end
end
