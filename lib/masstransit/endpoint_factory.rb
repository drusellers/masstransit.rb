module MassTransit
  class EndpointFactory
    @@factories = []
  
    def get_type()
      return ""
    end

    def self.get_type()
      return ""
    end
  
    def self.supports(scheme)
      @@factories.each { |factory|
        if factory.supports(scheme)
          return true
        end
      }
      return false
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
      unless get_type() == ""
        return nil
      end

      @@factories.each { |factory|
        if factory.supports( uri.scheme )
	  			return factory.getEndpoint uri 
				end
      }
      return nil
    end
  end    
  
  here = File.expand_path(File.dirname(__FILE__))
  
  EndpointFactory.load(here + "/endpoints")
end
