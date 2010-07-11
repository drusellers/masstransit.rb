module MassTransit
	class Bus
    attr_reader :addr

    def initialize (address)
      @addr = address
      @consumers = []
    end

	  def subscribe_type(message_name, action_to_take)
	   consumer = Consumer.new lambda{|msg|
	     if(msg.class == message_name)
	       return action_to_take
       end
	    }
	   @consumers << consumer
	   return consumer
    end
    
    def subscribe(action)
      consumer = Consumer.new action
      @consumers << consumer
      return consumer
    end
    
    def deliver(msg)
      @consumers.each do |c|
        c.consume msg
      end
    end
    
    def publish(msg)
      @addr.send msg
    end
    
	end
end
