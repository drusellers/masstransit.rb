module ActionConsumer
  class Base
    def self.inherited(klass)
      raise 'you must have a consume method' unless klass.method_defined? :consume
    end
  end
end