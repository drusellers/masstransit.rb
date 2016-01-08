module MassTransit
  #a simple class to wrap the message and name
  class Envelope
    #MT needs lower case?
    attr_accessor :messageType
    attr_accessor :message
      
    def initialize()
    end
    
#    def initialize(message_name, body)
#      @message_name = message_name
#      @body = body
#    end
  end
end