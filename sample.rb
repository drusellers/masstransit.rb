require 'lib/masstransit'
require 'json'



consume 'messagename' do |msg|
  puts msg
end
consume 'messagename' do |msg|
  puts msg + '2'
end

#how to make this a test?
env = MassTransit::Envelope.new 'messagename','hi'
deliver env