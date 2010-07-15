module MassTransit
  class LoopbackEndpointFactory < EndpointFactory

    def self.get_type
      return "Loopback"
    end
    
    def get_type
      return self.get_type
    end
  
    def self.supports?(scheme)
      return 'loopback'.casecmp(scheme) == 0
    end

    def self.get_endpoint(uri)
      LoopbackEndpoint.new uri
    end
  end
end
