class TicketsController < ApplicationController
  before_action :user_login_check

  def edit
    @bus = Bus.find(params[:bus_id])
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.availability = 1
    if @ticket.save #create new oder if ticket purchased
      Order.create(user_id: session[:uid], bus_id: @ticket.bus_id, ticket_id: @ticket.id)
      redirect_to buses_path
    end
  end
end
