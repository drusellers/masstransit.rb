require 'json/add/rails'
# may want to write my own to change the json_class bit
#http://flori.github.com/json/doc/classes/Object.html#method-i-to_json
#look at the source and hack! whoot whoot

module MassTransit

  class Serializer
    def serialize(obj)
      return obj.to_json
    end
    
    def deserialize(data)
      return JSON.parse(data)
    end
  end  

end
