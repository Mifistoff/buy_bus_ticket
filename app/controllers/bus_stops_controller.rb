class BusStopsController < ApplicationController
  before_action :user_login_check

  def new
    @bus = Bus.find(params[:bus_id])
    @bus_stop = @bus.bus_stop.new(bus_stop_params)
    redirect_to bus_path(@bus)
  end

  def create

  end

  private
  def bus_stop_params
    params.require(:bus_stop).permit(:number, :name, :arrival_time)
  end
end
