module MassTransit
	class Bus
    attr_reader :addr

    def initialize (address)
      @addr = address
      @subscriptions = []
    end

	  def subscribe_type(message_name, action_to_take)
	   subscription = Subscription.new 'message_name', lambda{|msg|
	     if(msg.class == message_name)
	       return action_to_take
       end
	    }
	   @subscriptions << subscription
	   return subscription
    end
    
    def subscribe(action)
      subscription = Subscription.new '', action
      @subscriptions << subscription
      return subscription
    end
    
    def deliver(msg)
      @subscriptions.each do |s|
        c = s.action.call msg
        c.call msg unless c == nil
      end
    end
    
    def publish(msg)
      @addr.send msg
    end
    
	end
end
