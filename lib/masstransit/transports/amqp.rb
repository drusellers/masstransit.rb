require 'carrot'

module MassTransit
  #The wrapper class on top of AMQP, that provides the standard
  #masstransit 'transport' api
  class Amqp
    def open(config)
      @client = Carrot.new(
        :host   => config.server,
        :port   => config.port,
        :user   => config.user,
        :pass   => config.password,
        :vhost  => config.vhost,
        :insist => config.insist
      )
    end
    
    #declares an AMQP queue
    def queue_declare(name)
      @client.queue(name)
    end
    
    #declares an AMQP exchange
    def exchange_declare(name)
      #durable
      #auto_delete
      @client.direct(name, :durable=>true)
    end
    
    #binds the queue to the exchange
    def queue_bind(queue, exchange)
      q = @client.queue(queue)
      q.bind(exchange)
    end
    
    #creates an AMQP message
    def create_message(data)
      msg_name = data.class.name
      msg = data
      msg = Message.new(msg_name, msg)
      
      return msg
    end
    
    def basic_publish(data, options)
      ex = options[:exchange]
    end
  end
end