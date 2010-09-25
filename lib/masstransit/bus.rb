require 'amqp'

module MassTransit
  #Provides access to the publish and subscribe contents
  class Bus
      def new(conf)
        @subscriptions = {}
        @transport = conf.transport
      end
      
      def publish(msg)
        msg_name = msg.class.name
        msg_data = msg
        envelope = Message.new(msg_name, msg_data)
        data = @serialiver.serialize(envelope)
        
        @transport.basic_publish(data, :exchange => msg_name) #exchange?
      end
      
      def subscribe(message_name, &block)
        @subscriptions = {} if @subscriptions.nil?
        consumers = @subscriptions[message_name]
        consumers = [] if consumers.nil?
        consumers << block
        @subscriptions[message_name] = consumers
      end
      
      #for local distribution
      def deliver(env)
        #read the YAML with the address of the server
        
        @subscriptions[env.message_name].each do |c|
          c.call env.body
        end
      end
  end
end
