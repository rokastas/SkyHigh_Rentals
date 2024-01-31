class DronesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @drones = Drone.all
  end

  def show
    @drone = Drone.find(params[:id])
  end
end
