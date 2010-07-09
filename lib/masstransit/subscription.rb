module MassTransit
	class Subscription
		def initialize(message_name, action)
			@message_name = message_name
			@action = action
		end
		
		attr_accessor :action
		attr_accessor :message_name
	end
end