class DashboardsController < ApplicationController
  before_action :user_dashboard, only: [:dashboard]

  def dashboard
    @user = current_user
    @drones = Drone.all
    @user_drones = @user.drones
    @user_drones_ids = @user.drones.ids
    @user_bookings = @user.bookings
    # @user_booked_drones = @user.booked_drones.includes(:drone)
      # get all bookings where my drones are booked
    @all_bookings = Booking.all
    @my_drones_bookings = []

    @user_drones_ids.each do |drone_id|
      @my_drones_bookings << @all_bookings.where(drone_id: drone_id)
    end
      # @bookings_of_my_drones = current_user.booked_drone_ids
  end

  private

  def user_dashboard
    order_options = { 'bookings.user_id' => :asc }
    @all_drones_grouped_by_user = Drone.includes(bookings: :user).order(order_options).group_by { |drone| drone.user }
  end
end

# filter bookings by
