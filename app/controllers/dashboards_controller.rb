class DashboardsController < ApplicationController

  def index
    @user = current_user

    @my_drones = Drone.where(user: @user)
    @my_bookings = Booking.where(drone: Drone.where(user: @user))
    @my_requests = @my_bookings.where(accepted: false)
  end

end
