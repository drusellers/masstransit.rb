module MassTransit
	class Subscription
		def initialize(address, message_name)
			@address = address
			@message_name = message_name
		end
		
		attr_accessor :address
		attr_accessor :message_name
	end
end