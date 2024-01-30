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
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @drone = @booking.drone
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to drone_path(@drone), notice: 'Booking was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:from_date, :to_date, :accepted)
  end
end
