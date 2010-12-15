module MassTransit
  
  #creates a method missing style dictionary for when
  #i don't have the actual type availible
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