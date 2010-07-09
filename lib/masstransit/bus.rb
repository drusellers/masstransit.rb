module MassTransit
	class Bus
    attr_reader :addr

    def initialize (address)
      @addr = address
    end

	  def subscribe(message_name, &action_to_take)
	   subscription = Subscription.new message_name, action_to_take
	   return subscription
    end
    
	end
end
