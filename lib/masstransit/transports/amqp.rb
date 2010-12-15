require 'carrot'

module MassTransit
  #The wrapper class on top of AMQP, that provides the standard
  #masstransit 'transport' api
  class Amqp
    
    #opens a connection to the Amqp server
    def open(config)
      @client = Carrot.new(
        :host   => config.server,
        :port   => config.port,
        :user   => config.user,
        :pass   => config.password,
        :vhost  => config.vdir,
        :insist => config.insist
      )
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
    def bind(queue, exchange)
      @client.topic(exchange, :durable=>true)
      q = @client.queue(queue)
      q.bind(exchange)
    end
    
    #unbnids the queue from the exchange
    def unbind(queue, exchange)
    end
    
    #creates a transport ready message object
    def create_message(data)
      msg_name = data.class.name
      msg = data
      msg = Envelope.new(msg_name, msg)
      
      return msg
    end
    
    def monitor(queue, callback)
      #basic consume / pop loop here
    end
    
    #pushes the message onto the exchange
    def send(queue, data)
      @client.queue(queue).publish(data)
    end
    
    def publish(exchange, data)
      #@client.exchanges[exchange].publish(data)
    end
  end
end