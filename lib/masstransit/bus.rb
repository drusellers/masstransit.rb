module MassTransit
  #The bus abstracts the desired transportation, and manages the callbacks
  #orchestrates the threading
  #
  #three main queues (data, control, poison)
  class Bus
      def initialize(conf)
        @subscriptions = {}
        @serializer = conf.serializer
        @transport = conf.transport
        @queue = conf.queue
        
        @transport.open(conf)
      end
      
      #this will register an exchange in rabbit for the 'message_name'
      #and then bind the queue to that exchange. it then sets
      # the subscriptions[message_name] to the callback provided
      def subscribe(message_name, &block)
        @subscriptions = {} if @subscriptions.nil?
        consumers = @subscriptions[message_name]
        consumers = [] if consumers.nil?
        consumers << block
        @subscriptions[message_name] = consumers
        @transport.bind message_name
      end
      
      #this will unregister the queue with the exchange in rabbitmq
      #for the message_name. It then removes the callbacks in the 
      #subscriptions
      def unsubscribe(message_name)
        @transport.unbind(message_name, @queue)
        
        #has key check
        @subscriptions.delete(message_name)
      
      end
      
      #tells the bus to start listening for messages
      #this method blocks forver. Need to implement
      #better ctrl-c support
      def start()
        #start listening
        @transport.monitor do |rmsg|
          consume(rmsg)
        end
      end
      
      def close()
        
      end
      
      #this will publish the message object to an exchange in rabbitmq
      #that is equal to the message class name. this is a direct concept
      #from .net and should be adopted into a more ruby manner
      def publish(message)
        envelope = @transport.create_message(message)
        data = @serializer.serialize(envelope)
        
        @transport.publish(envelope.message_name, data) #exchange?
      end
      
      #takes a rabbitmq message, strips off the noise and gets back to an 
      #envelope
      def consume(rmsg)
        data = @transport.get_message(rmsg)
        #payload is a string
        env = @serializer.deserialize data
        puts 'oeuaoeusatoehuntsaoheuntsahoeusnth'
        puts env
        deliver(env)
      end
      
      #for local distribution
      def deliver(env)
        consumers = @subscriptions[env.message_name]
        consumers = [] if consumers.nil?
        consumers.each do |c|
          c.call env.body
        end
      end
  end
end
