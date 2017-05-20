class BusesController < ApplicationController
before_action :user_login_check

  def index
    @buses = Bus.search(params[:search]).order(:departure_time)
  end

  def show
    @bus = Bus.find(params[:id])
    @orders = Order.where(bus_id: @bus.id)
  end

  def new
    @bus = Bus.new
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def create
    @bus = Bus.new(bus_params)

    if @bus.save #add tickets on db
      add_tickets(@bus)
    end
    redirect_to @bus
  end

  def update
    @bus = Bus.find(params[:id])
    del_tickets(@bus)
    @bus.update(bus_params)
    add_tickets(@bus)

    redirect_to @bus
  end

  def destroy
    @bus = Bus.find(params[:id])
    del_tickets(@bus)
    @bus.destroy

    redirect_to @bus
  end

  private
  def bus_params  #parameters for bus
    params.require(:bus).permit(:number_of_tickets, :departure, :departure_time, :destination, :destination_time)
  end

  def add_tickets(bus) #add all tickets in BD
    1.upto(bus.number_of_tickets) do |i|
      Ticket.create(number: i, availability: 0, bus_id: bus.id)
    end
  end

  def del_tickets(bus) #deliting all tickets from DB
    @tickets = Ticket.where(bus_id: bus.id)
    @tickets.destroy_all
  end
end


