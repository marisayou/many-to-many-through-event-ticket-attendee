class Event
  attr_reader :total_cost, :ticket_price

  @@all = []

  def initialize(total_cost, ticket_price)
    @total_cost = total_cost
    @ticket_price = ticket_price
    @@all << self
  end

  def self.all 
    @@all
  end

  def sales_to_break_even
    revenue = self.tickets.length * ticket_price
    rev_to_break_even = total_cost - revenue
    if rev_to_break_even <= 0
      return 0
    end

    tickets_to_sell = rev_to_break_even/ticket_price
    if rev_to_break_even%ticket_price > 0
      return tickets_to_sell + 1
    end
    return tickets_to_sell
  end
  
  def tickets
    Ticket.all.select do |ticket|
      ticket.event == self
    end
  end

  def sell_ticket(attendee)
    Ticket.new(self, attendee)
  end

  def attendees
    self.tickets.map do |ticket|
      ticket.attendee
    end
  end

  def average_age
    sum_ages = 0
    self.tickets.map do |ticket|
      sum_ages += ticket.attendee.age
    end
    sum_ages/self.tickets.length
  end
    
end

# Event.all
  # Returns an array of all Events
# Event#sales_to_break_even
  # Returns the number of Tickets that still need to be "purchased" for this Event before the Event reaches the break-even point.
  # If the Event has sold enough Tickets to break-even, return the number 0. 
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
