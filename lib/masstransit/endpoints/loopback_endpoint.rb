module MassTransit
  class LoopbackEndpoint < Endpoint

    def initialize uri
      @url = uri
    end

  end
end
