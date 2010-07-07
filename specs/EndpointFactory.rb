class EndpointFactory
  @@factories = {}
  
  def get_type()
    return ""
  end
  
  def EndpointFactory.add_factory(scheme, factory)
    @@factories[scheme] = factory
  end
  
  def EndpointFactory.factories
    return @@factories
  end
end

class LoopbackEndpointFactory < EndpointFactory
  def get_type()
    return "Loopback"
  end
end

EndpointFactory.add_factory(:loopback, LoopbackEndpointFactory)

class RabbitMQEndpointFactory < EndpointFactory
  def get_type()
    return "RabbitMQ"
  end
end

EndpointFactory.add_factory(:rabbitmq, RabbitMQEndpointFactory)
