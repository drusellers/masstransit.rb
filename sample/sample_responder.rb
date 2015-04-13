require '../lib/masstransit'

class MyMessage
  attr_accessor :name
  # We use this to set the outgoing message type/exchange name
  # Need this so that on the net side MT will map to our class
  # I could not see an easy way to get the same on Ruby to be usable in .net
  def messageType
    return "myNamespace:PingResponse"    
  end

  def initialize()
    @name = 'dru'
  end
end

conf = MassTransit.load_config('./sample_subscriber.yaml')
bus = MassTransit::Bus.new(conf)

bus.publish(MyMessage.new)   #need the urn

#subscribe stuff
bus.subscribe('myNamespace:Ping') do |msg|
  #What we get is a hash, not a proper type. Ho Hum
  puts msg
  bus.publish(MyMessage.new)   
end

bus.start()

sleep 1000