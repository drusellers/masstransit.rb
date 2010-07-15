version = ARGV.pop

%w( messageconsumer ).each do |framework|
  puts "Building and pushing #{framework}..."
  `cd #{framework} && gem build #{framework}.gemspec && gem push #{framework}-#{version}.gem && rm #{framework}-#{version}.gem`
end

puts "Building and pushing MassTransit..."
`gem build masstransit.gemspec`
`gem push masstransit-#{version}.gem`
`rm masstransit-#{version}.gem`