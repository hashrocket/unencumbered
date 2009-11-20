module Spec::DSL::Main
  alias :Feature :describe
  def narrative(description)
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

  def But(description, &blk)
    example("But #{description}", &blk)
  end

  def executes(scope=:all, &blk)
    before(scope, &blk)
  end

  def Background(description, &blk)
    describe("Background #{description}", &blk)
  end
end
