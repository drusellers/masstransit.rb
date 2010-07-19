module MassTransit
  class Envelope
    attr_accessor :message_name
    attr_accessor :body
    
    def initialize(message_name, body)
      @message_name = message_name
      @body = body
    end
  end
  
  module Bus

    def consume(message_name, &block)
      @consumers = {} if @consumers.nil?
      consumers = @consumers[message_name]
      consumers = [] if consumers.nil?
      consumers << block
      @consumers[message_name] = consumers
    end
    
    def publish(msg)
      env = Envelope.new 'messagename', msg
      endpoint.send(env)
    end
    
    #for local distribution
    def deliver(env)
      #read the YAML with the address of the server
      
      @consumers[env.message_name].each do |c|
        c.call env.body
      end
    end
  end

end