require 'MQ'

module MassTransit
  class RabbitMqEndpoint < Endpoint

    def initialize uri
      @url = uri
    end

    def send (msg)
      EM.run {
        q = MQ.direct(@url.path)
        q.publish(msg)

        EM.stop_event_loop
      }
    end

  end
end
