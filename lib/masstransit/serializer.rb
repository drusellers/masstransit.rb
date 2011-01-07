require 'json/add/rails'
# may want to write my own to change the json_class bit
#http://flori.github.com/json/doc/classes/Object.html#method-i-to_json
#look at the source and hack! whoot whoot

module MassTransit

  class Serializer
    def serialize(env)
      #enforce that env is an Envelope
      return env.to_json
    end
    
    #returns an Envelope
    def deserialize(data)
      result = JSON.parse(data)
      
      result = MassTransit::Message.new(result) if result.class == Hash
      
      result
    end
  end  

end
