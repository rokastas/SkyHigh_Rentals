class DronesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @drones = Drone.all
    filter_drones
  end

  def show
    @drone = Drone.find(params[:id])
  end

  private

  def filter_drones
    @drones = Drone.all
    @drones = @drones.where("category ILIKE :query OR price ILIKE :query", query: "%#{params[:query]}%") if params[:query].present?
    @drones = @drones.where(category: params[:category]) if params[:category].present?
    @drones = @drones.where("price >= ?", params[:min_price]) if params[:min_price].present?
    @drones = @drones.where("price <= ?", params[:max_price]) if params[:max_price].present?
  end
end
