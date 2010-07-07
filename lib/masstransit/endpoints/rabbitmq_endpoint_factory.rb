module MassTransit
  class RabbitMQEndpointFactory < EndpointFactory
    def get_type()
      return "RabbitMQ"
    end

    def RabbitMQEndpointFactory.supports(scheme)
      return 'rabbitmq'.eql?(scheme)
    end
  end
end