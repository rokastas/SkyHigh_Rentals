class DronesController < ApplicationController
  def index
    @drones = Drone.all
  end

  def show
    @drone = Drone.find(params[:id])
  end
end
