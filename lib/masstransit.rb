require 'rubygems'
require 'json' unless defined?(JSON)

here = File.expand_path(File.dirname(__FILE__))

$LOAD_PATH << "#{here}/masstransit"
require 'base'
require 'main'
require 'urn'
#require 'publisher'
#require 'endpoint'
#require 'endpoint_factory'
