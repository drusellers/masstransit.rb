module MassTransit
  class EndpointFactory
    @@factories = []
  
    def get_type()
      return ""
    end
  
    def EndpointFactory.supports(scheme)
      @@factories.each { |factory|
        if factory.supports(scheme)
          return true;
        end
        }
      return false
    end
  
    def EndpointFactory.inherited(ef)
      @@factories.push(ef)
    end
  
    def EndpointFactory.factories
      return @@factories
    end
    
    def EndpointFactory.load( dirname )
      Dir.open( dirname ).each { |fn|
        next unless ( fn =~ /[.]rb$/ )
        require "#{dirname}/#{fn}"
      }
    end
  end    
end



