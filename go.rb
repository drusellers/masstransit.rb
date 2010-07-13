require 'json'

module Sample
  class SampleClass
  end
end

def subscribe(handler)
  @handle = handler
end

def subscribe(type, handler)
  @handle = lambda{|msg|
    if type == msg.class
      return handler
    end
  }
end

def deliver(msg)
  i = @handle.call(msg)
  i.call(msg) unless i == nil
end

subscribe Sample::SampleClass, lambda{|m|
  #do stuff
}

deliver Sample::SampleClass.new



name = Sample::SampleClass.name
#puts name.gsub '::', '.'