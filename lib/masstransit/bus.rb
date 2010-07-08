module MassTransit
	class Bus
    attr_reader :addr

    def initalize address
      @addr = address
    end

	  def subscribe(message_name)
      return Subscription.new @addr, message_name
    end
	end
end
