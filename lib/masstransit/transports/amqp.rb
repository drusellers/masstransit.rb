require 'bunny'
require 'guid'

module MassTransit
  #The wrapper class on top of AMQP, that provides the standard
  #masstransit 'transport' api
  class Amqp
    
    #opens a connection to the Amqp server
    def open(config)
      @client = Bunny.new(
        :logging=>true,
        :host => config.server,
        :port   => config.port,
        :user   => config.user,
        :pass   => config.password,
        :vhost  => config.vdir,
        :insist => config.insist
      )
      @queue = config.queue
      @client.start
    end
    
    #closes the connection to the Amqp server
    def close()
      @client.close()
    end
    
    #declares a queue on the server
    def queue_declare(name)
      @client.queue(name)
    end
    
    def queue_delete(name)
      #how to?
    end
    
    #binds the queue to the exchange
    def bind(exchange)
      ex = @client.exchange(exchange, :type=>:fanout, :durable=>true)
      q = @client.queue(@queue)
      q.bind(ex)
    end
    
    #unbnids the queue from the exchange
    def unbind(queue, exchange)
    end
    
    #creates a transport ready message object
    def create_message(data, serializer)
      msg_name = data.class.name.gsub("::",".")
      msg = data
      
      env = Envelope.new
      env.MessageType = msg_name
      #this needs to be a string for .net
      env.Message = serializer.serialize(msg)
      
      return env
    end
    
    def get_message(rmsg)
      return rmsg[:payload]
    end
    
    def monitor(&block)
      #basic consume / pop loop here
      q = @client.queue(@queue)
      q.subscribe(:consumer_tag => 'testtag1', :timeout => 30) do |msg|
        block.call msg
      end

    end
    
    #pushes the message onto the exchange
    def send(queue, data)
      @client.queue(queue).publish(data)
    end
    
    def publish(exchange, data)
      id = Guid.new.to_s
      ex = @client.exchange(exchange, :type=>:fanout, :durable=>true, :message_id=>id)
      ex.publish(data)
    end
  end
end