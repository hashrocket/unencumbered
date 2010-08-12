# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{unencumbered}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Hashrocket"]
  s.date = %q{2010-08-12}
  s.description = %q{You got Cucumber in my RSpec!}
  s.email = %q{info@hashrocket.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.textile"
  ]
  s.files = [
    ".document",
     ".gitignore",
     ".rspec",
     "LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION",
     "lib/unencumbered.rb",
     "spec/lib/unencumbered_spec.rb",
     "spec/spec_helper.rb",
     "unencumbered.gemspec"
  ]
  s.homepage = %q{http://github.com/hashrocket/unencumbered}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Just enough Cucumber in RSpec.}
  s.test_files = [
    "spec/lib/unencumbered_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

