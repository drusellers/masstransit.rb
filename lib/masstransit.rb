require 'rubygems'
require 'json' unless defined?(JSON)

here = File.expand_path(File.dirname(__FILE__))

$LOAD_PATH << "#{here}/message_consumer"

require 'base'
require 'consumer'
require 'publisher'
require 'endpoint'
require 'endpoint_factory'
