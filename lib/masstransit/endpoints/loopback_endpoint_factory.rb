module MassTransit
    class LoopbackEndpointFactory < EndpointFactory
    def get_type()
      return "Loopback"
    end
  
    def LoopbackEndpointFactory.supports(scheme)
      return 'loopback'.eql?(scheme)
    end
  end
end