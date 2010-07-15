require 'carrot'

module MassTransit
  class RabbitMqEndpoint < Endpoint

    attr_reader :queue

    def initialize uri
      @queue = Carrot.queue(uri.path)
    end

    def send msg
      @queue.publish(msg)
    end

  end
end
