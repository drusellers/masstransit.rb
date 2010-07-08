module MassTransit
	class Bus
	  def subscribe(klass)
	    subscription = Subscription.new 'addr' klass
    end
	end
end