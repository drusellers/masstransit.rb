require 'rubygems'
require 'json' unless defined?(JSON)

here = File.expand_path(File.dirname(__FILE__))

$LOAD_PATH << "#{here}/masstransit"
require 'bus'
require 'config'
require 'message'
require 'serializer'
require 'untyped_message'
require 'transports/amqp'
