require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Example of a variable definition that will be available in your Pry session once you've built out the model:

lucy = Attendee.new("Lucy", 22)
george = Attendee.new("George", 30)
sabrina = Attendee.new("Sabrina", 26)

venue1 = Venue.new("venue1", "seattle", 1000)
venue2 = Venue.new("venue2", "redmond", 1500)

event1 = Event.new(1000, 400, venue1, "event1")
event2 = Event.new(2500, 500, venue2, "event2")
event3 = Event.new(1000, 300, venue1, "event3")

lucy.buy_ticket(event1)
lucy.buy_ticket(event2)
lucy.buy_ticket(event3)
george.buy_ticket(event1)
sabrina.buy_ticket(event2)
sabrina.buy_ticket(event3)

lucy.events
lucy.money_spent
george.events
george.money_spent
sabrina.events
sabrina.money_spent



binding.pry
0 #leave this here to ensure binding.pry isn't the last line
