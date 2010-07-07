require 'rubygems'
require 'json' unless defined?(JSON)

here = File.expand_path(File.dirname(__FILE__))

$LOAD_PATH << "#{here}/masstransit"

require 'bus'
require 'subscription'
require 'endpoint_factory'
require 'endpoint'
