require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "unencumbered"
    gem.summary = %Q{Just enough Cucumber in RSpec.}
    gem.description = %Q{You got Cucumber in my RSpec!}
    gem.email = "info@hashrocket.com"
    gem.homepage = "http://github.com/hashrocket/unencumbered"
    gem.authors = ["Hashrocket"]

    gem.add_dependency 'rspec', '>= 2.0.0.beta.19'
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rspec'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => [:spec, :test]
