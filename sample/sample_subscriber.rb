require '../lib/masstransit'

class MyMessage
  attr_accessor :name
  
  def initialize()
    @name = 'dru'
  end
end

conf = MassTransit.load_config('./sample_subscriber.yaml')
bus = MassTransit::Bus.new(conf)

#subscribe stuff
bus.subscribe('MyMessage') do |msg|
  puts msg.name
end

bus.start()