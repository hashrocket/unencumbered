module Spec::DSL::Main
  alias :Feature :describe
  def Story(description)
    @description_args.push("\n#{description}\n")
  end
end

module Spec::Example::ExampleGroupMethods
  def Scenario(description, &blk)
    describe("Scenario:  #{description}", &blk)
  end

  def Given(description, &blk)
    describe("Given #{description}", &blk)
  end

  def When(description, &blk)
    describe("When #{description}", &blk)
  end

  def Then(description, &blk)
    example("Then #{description}", &blk)
  end

  def And(description, &blk)
    example("And #{description}", &blk)
  end

  def executes(scope=:all, &blk)
    before(scope, &blk)
  end

  def Background(description, &blk)
    describe("Background #{description}", &blk)
  end
end

if defined? ActionController::Integration::Session
  class ActionController::Integration::Session
    include Spec::Matchers
  end
end

if defined? Webrat
  Webrat.configure do |config|
    config.mode = :rails
  end

  if defined? Spec::Runner
    Spec::Runner.configure do |config|
      config.include(Webrat::Matchers, :type => [:integration])
    end
  end
end
