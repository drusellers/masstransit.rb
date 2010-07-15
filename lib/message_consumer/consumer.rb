module MassTransit
  # consumers are attached to buses and contain the consume action
	class Consumer
		def initialize(action)
			@action = action
		end
		
		def consume(msg)
		  followon = @action.call msg
		  followon.call msg unless followon == nil
	  end
	end
end
