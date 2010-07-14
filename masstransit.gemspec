version = File.read(File.expand_path("../MASSTRANSIT_VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'masstransit'
  s.version     = version
  
  s.summary     = 'a simple message framework'
  s.description = 'simple'
  
  s.author            = 'ACM,PBG,LEGO'
  s.email             = 'dru@drusellers.com'
  s.homepage          = 'http://www.masstransit.com'
  s.rubyforge_project = 'masstransit'

  #s.bindir             = 'bin'
  #s.executables        = ['mt']
  #s.default_executable = 'mt'
end