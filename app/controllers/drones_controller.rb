class DronesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @drones = Drone.all
  end

  def show
    @drone = Drone.find(params[:id])
  end

  def new
    @drone = Drone.new
  end

  def create
    @drone = Drone.new(drone_params)
    @drone.user = current_user
    if @drone.save!
      redirect_to dashboards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def drone_params
    params.require(:drone).permit(:price, :brand, :model, :time_in_air, :description, :weight, :category, :availability)
  end
end
