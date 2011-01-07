require 'active_support'
require 'ostruct'
# may want to write my own to change the json_class bit
#http://flori.github.com/json/doc/classes/Object.html#method-i-to_json
#look at the source and hack! whoot whoot

module MassTransit

  class Serializer
    def serialize(env)
      #enforce that env is an Envelope
      return ActiveSupport::JSON.encode env
    end
    
    #returns an Envelope
    def deserialize(data)
      result = ActiveSupport::JSON.decode(data)
      
      result = MassTransit::Message.new(result)
      
      result
    end
  end  

end
