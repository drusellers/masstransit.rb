module MassTransit
  
  class Message
    
    def initialize(hash)
      @hash = hash
    end
    
    def method_missing(name, *args)
      return @hash[name] if @hash.key? name
      super
    end
    
  end

end