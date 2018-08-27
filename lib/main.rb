require_relative 'libs'
minutes_delayed = Eta.minutes_delayed_to 'elmhurst'
puts "Train delayed #{minutes_delayed} minutes"
