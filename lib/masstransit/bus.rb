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
    
    def subscription_count()
      return @subscriptions.length
    end
    
    def deliver(msg)
      @subscriptions.each do |s|
        s.action.call(msg)
      end
      
    end
    
	end
end
