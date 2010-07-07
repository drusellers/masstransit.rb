module MassTransit
  class RabbitMQEndpointFactory < EndpointFactory
    def get_type()
      return "RabbitMQ"
    end

    def RabbitMQEndpointFactory.supports(scheme)
      return 'rabbitmq'.casecmp(scheme) == 0
    end
  end
end