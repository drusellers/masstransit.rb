require 'carrot'

module MassTransit
  class RabbitMqEndpoint < Endpoint

    def initialize uri
      @url = uri
    end

    def send (msg)
      q = Carrot.queue(@url.path)
      q.publish(msg)

      Carrot.stop
    end

  end
end
