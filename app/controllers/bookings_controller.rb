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
    @booking.update(accepted: params[:accepted])
    redirect_to dashboard_path, notice: 'Booking was successfully accepted.'
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete

    redirect_to dashboards_path
  end

  private

  def booking_params
    params.require(:booking).permit(:from_date, :to_date, :accepted)
  end
end
