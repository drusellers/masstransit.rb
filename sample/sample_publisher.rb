require '../lib/masstransit'

class MyMessage
  attr_accessor :name
  
  def initialize()
    @name = 'dru'
  end
end

conf = MassTransit.load_config('./sample_publisher.yaml')
bus = MassTransit::Bus.new(conf)

(0...20).each do
  bus.publish(MyMessage.new)
end