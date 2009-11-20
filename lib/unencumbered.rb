module Spec::DSL::Main
  alias :Feature :describe
  def narrative(description)
    @description_args.push("\n#{description}\n")
  end
end

module Spec::Example::ExampleGroupMethods
  def Scenario(description, &implementation)
    describe("Scenario:  #{description}", &implementation)
  end

  def Given(description, &implementation)
    describe("Given #{description}", &implementation)
  end

  def When(description, &implementation)
    describe("When #{description}", &implementation)
  end

  def Then(description, &implementation)
    example("Then #{description}", &implementation)
  end

  def And(description, &implementation)
    example("And #{description}", &implementation)
  end

  def But(description, &implementation)
    example("But #{description}", &implementation)
  end

  def executes(scope=:all, &implementation)
    before(scope, &implementation)
  end

  def Background(description, &implementation)
    describe("Background #{description}", &implementation)
  end
end
