module MassTransit
  # Bus handles the interaction with the service bus
	class Bus
    attr_reader :addr

    def initialize (address)
      @addr = address
      @consumers = []
    end

    # subscribe to a specific message type
	  def subscribe_type(message_name, action_to_take)
	   consumer = Consumer.new lambda{|msg|
	     if(msg.class == message_name)
	       return action_to_take
       end
	    }
	   @consumers << consumer
	   return consumer
    end
    
    # subscribe to any message with a given action
    def subscribe(action)
      consumer = Consumer.new action
      @consumers << consumer
      return consumer
    end
    
    # provides a given message to each consumer on the bus
    def deliver(msg)
      @consumers.each do |c|
        c.consume msg
      end
    end
    
    # publishes a message to the given endpoint
    def publish(msg)
      @addr.send msg
    end
    
	end
end
