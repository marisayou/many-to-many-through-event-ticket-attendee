class Venue
    attr_reader :name, :location, :rental_fee

    @@all = []

    def initialize(name, location, rental_fee)
        @name = name
        @location = location
        @rental_fee = rental_fee
        @@all << self
    end

    def self.all
        @@all
    end

    def events
        Event.all.select do |event|
            event.venue == self
        end
    end

    def revenue
        events.length * rental_fee
    end

    def attendees
        attendees_list = []
        self.events.each do |event|
            event.attendees.each do |attendee|
                attendees_list << attendee if !attendees_list.include?(attendee)
            end
        end
        return attendees_list
    end

end

# Venue.all
    # Returns an array of all Venues
# Venue#events
    # Returns an array of Events that are take place at this Venue
# Venue#revenue
    # Returns the total amount of money the venue has made from hosting Events
# Venue#attendees
    # Returns an array of every Attendee that has purchased a Ticket for an Event held at this Venue
