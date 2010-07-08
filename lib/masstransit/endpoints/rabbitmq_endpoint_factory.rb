module MassTransit
  class RabbitMQEndpointFactory < EndpointFactory
    def self.get_type()
      return "RabbitMQ"
    end

    def self.supports(scheme)
      return 'rabbitmq'.casecmp(scheme) == 0
    end
  end
end
