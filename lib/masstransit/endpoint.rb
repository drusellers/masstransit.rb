module MassTransit
  # encapsulates the ability to send to a given endpoint
  class Endpoint
    # sends a given message to endpoint in question
    def send(message)
    end

    # The url this endpoint is attached to
    attr_reader :url
  end
end
