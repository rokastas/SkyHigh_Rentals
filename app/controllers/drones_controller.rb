class DronesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @drones = Drone.all
    filter_drones
  end

  def show
    @drone = Drone.find(params[:id])
    @drones = Drone.all
    @same_category_drones = @drones.where(category: Drone.find(params[:id]).category)
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

  def filter_drones
    @drones = Drone.all
    @drones = @drones.where("category ILIKE :query OR price ILIKE :query", query: "%#{params[:query]}%") if params[:query].present?
    @drones = @drones.where(category: params[:category]) if params[:category].present?
    @drones = @drones.where("price >= ?", params[:min_price]) if params[:min_price].present?
    @drones = @drones.where("price <= ?", params[:max_price]) if params[:max_price].present?
  end
end
