require '../lib/masstransit'

class MyMessage
  attr_accessor :name
  
  def initialize()
    @name = 'dru'
  end
end

conf = MassTransit.load_config('./sample.yaml')
bus = MassTransit::Bus.new(conf)

(0...20000).each do
  bus.publish(MyMessage.new)
end