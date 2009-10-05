module Spec::DSL::Main
  alias :Feature :describe
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
