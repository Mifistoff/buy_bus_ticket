class Bus < ApplicationRecord
  has_many :bus_stops
  has_many :tickets
  attr_reader :name
  has_many :orders

  def name
    departure + ' - ' + destination
  end

  def available_tickets
    Ticket.where(bus_id: id, availability: 0).size
  end

  def self.search(search)
    if search
      where('departure LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
