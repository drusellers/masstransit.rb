require 'yaml'
require 'transports/amqp'
require 'serializer'

module MassTransit
  #A class that groups all of the configuration options and provides defaults
  #Currently AMQP is the only transport option
  class Config
    attr_accessor :server
    attr_accessor :port
    attr_accessor :vdir
    attr_accessor :user
    attr_accessor :password
    attr_accessor :insist
    attr_accessor :transport
    attr_accessor :serializer
    
    def new()
      @server = 'localhost'
      @port = 5672
      @vdir = '/'
      @user = 'guest'
      @password = 'guest'
      @insist = true
      @transport = Amqp.new()
      @serializer = Serializer.new
    end
  end
  
  # Sample Config File
  # ---
  # server : localhost
  # port : 5672
  # vdir : /
  # user : guest
  # password : guest
  # insist: true  def load_config(file_name)
  def MassTransit.load_config(file_name)
    o = YAML::load_file(file_name)
    cfg = Config.new
    
    cfg.server = o['server']
    cfg.port = o['port']
    cfg.vdir = o['vdir']
    cfg.user = o['user']
    cfg.password = o['password']
    cfg.insist = o['insist']
    
    return cfg
  end

end