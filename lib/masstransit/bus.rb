module MassTransit
	class Bus
    attr_reader :addr

    def initialize (address)
      @addr = address
      @subscriptions = []
    end

	  def subscribe(message_name, &action_to_take)
	   subscription = Subscription.new message_name, action_to_take
	   @subscriptions << subscription
	   return subscription
    end
    
    def deliver(msg)
      @subscriptions.each do |s|
        if s.message_name == msg.class
          s.action.call(msg)
        end
      end
      
    end
    
	end
end
