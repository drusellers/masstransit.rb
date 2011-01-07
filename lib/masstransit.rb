require 'rubygems'
require 'active_support' unless defined?(ActiveSupport)

here = File.expand_path(File.dirname(__FILE__))

$LOAD_PATH << "#{here}/masstransit"
require 'bus'
require 'config'
require 'message'
require 'serializer'
require 'envelope'
require 'transports/amqp'
require 'urn'