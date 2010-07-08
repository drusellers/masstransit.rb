require 'lib/masstransit'

s = MassTransit::Subscription.new "addr", "msg"

puts s.address
puts s.message_name