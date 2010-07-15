module MessageConsumer
  module Publisher
    #this is meant to be a mix in?
    
    def send(uri, message)
      ep = EndpointFactory.get_endpoint uri
      ep.send message
    end
    
    def publish(message)
    end
    
  end
end