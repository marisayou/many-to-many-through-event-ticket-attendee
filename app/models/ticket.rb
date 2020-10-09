class Ticket
    attr_reader :event, :attendee

    @@all = []

    def initialize(event, attendee)
        @event = event
        @attendee = attendee
        @@all << self
    end

    def self.all
        @@all
    end

end

# Ticket.all
    # Returns an array of all Ticket instances
