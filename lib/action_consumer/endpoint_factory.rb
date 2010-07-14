module MassTransit
  class EndpointFactory
    @@factories = []
  
    def get_type
      ""
    end

    def self.get_type
      ""
    end
  
    def self.supports?(scheme)
      @@factories.each do |factory|
        return true if factory.supports? scheme
      end
      false
    end
  
    def self.inherited(ef)
      @@factories.push(ef)
    end
  
    def self.factories
      return @@factories
    end
    
    def self.load( dirname )
      Dir.open( dirname ).each { |fn|
        next unless ( fn =~ /[.]rb$/ )
        require "#{dirname}/#{fn}"
      }
    end

    def self.getEndpoint( uri )
      return nil unless get_type == ""

      @@factories.each do |factory|
        return factory.getEndpoint(uri) if factory.supports?( uri.scheme )
      end
      
      nil
    end
  end    
  
  here = File.expand_path(File.dirname(__FILE__))
  
  EndpointFactory.load(here + "/endpoints")
end
