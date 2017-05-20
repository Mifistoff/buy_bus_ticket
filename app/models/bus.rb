class Bus < ApplicationRecord
  has_many :bus_stops
  has_many :tickets
  attr_reader :name
  has_many :orders

  def name #name of bus from start and final stations
    departure + ' - ' + destination
  end

  def available_tickets #how many tickets not purchased
    Ticket.where(bus_id: id, availability: 0).size
  end

  def self.search(search) #for search form on bus list
    if search
      where('departure LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
