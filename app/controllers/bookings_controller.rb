class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @drone = Drone.find(params[:drone_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @drone = Drone.find(params[:drone_id])
    @booking.drone = @drone
    @booking.user = current_user
    if @booking.save
      redirect_to drones_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:from_date, :to_date)
  end
end
