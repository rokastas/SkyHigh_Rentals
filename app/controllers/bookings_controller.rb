class BookingsController < ApplicationController
  def new
  end

  def create
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
