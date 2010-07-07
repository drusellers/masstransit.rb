require 'endpoint'

module MassTransit
    class LoopbackEndpointFactory < EndpointFactory
    def get_type()
      return "Loopback"
    end
  
    def LoopbackEndpointFactory.supports(scheme)
      return 'loopback'.casecmp(scheme) == 0
    end

    def getEndpoint(uri)
      Endpoint.new
    end
  end
end
