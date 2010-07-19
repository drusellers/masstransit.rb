require 'lib/masstransit'


consume 'messagename' do |msg|
  puts msg
end
consume 'messagename' do |msg|
  puts msg + '2'
end

env = MassTransit::Envelope.new 'messagename','hi'

deliver env