class DashboardsController < ApplicationController
  def index
    @user = current_user

    @my_requests = Booking.where(drone: Drone.where(user: @user)).where(accepted: false)
    @my_drones = Drone.where(user: @user)
    @my_bookings = Booking.where(user: @user)
  end
end
