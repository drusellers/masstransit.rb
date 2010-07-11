module MassTransit
	class Subscription
		def initialize(action)
			@action = action
		end
		
		attr_accessor :action
	end
end