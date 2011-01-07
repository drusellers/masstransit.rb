require 'ostruct'

module MassTransit
  
  #creates a method missing style dictionary for when
  #i don't have the actual type availible
  class Message
    attr_accessor :hash
    
    def initialize(hash)
      @hash = hash
      @o = OpenStruct.new hash
    end
    
    def method_missing(name, *args)
      value = o.send name, args 
      return value if value.nil? == false
      super
    end
    
  end

end