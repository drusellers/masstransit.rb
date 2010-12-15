module MassTransit
  
  class Urn
    attr_accessor :kind
    
    def initialize(args)
      if args.class == Class
        args = args.to_s.sub '::',':'
      end
      @kind = args.sub '.',':'
    end
    
  end
end