class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bus
  belongs_to :ticket

  def bus_name
    Bus.find(bus_id).name
  end

  def bus_departure_time
    Bus.find(bus_id).departure_time
  end

  def ticket_number
    Ticket.find(ticket_id).number
  end

  def user_login
    User.find(user_id).login
  end
end
