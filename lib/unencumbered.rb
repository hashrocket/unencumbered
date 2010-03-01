if defined?(Spec)
  module Spec::DSL::Main
    alias_method :Feature, :describe
    def narrative(description)
      @description_args.push("\n#{description}\n")
    end
  end

  module Spec::Example::ExampleGroupMethods
    def Scenario(description, &implementation)
      describe("Scenario: #{description}", &implementation)
    end

    def executes(scope=:all, &implementation)
      before(scope, &implementation)
    end

    def method_missing(symbol,*args,&block)
      if symbol.to_s =~ /Given|When|Background/
        describe("#{symbol} #{args.first}", &block)
      elsif symbol.to_s =~ /Then|And|But/
        example("#{symbol} #{args.first}", &block)
      end
    end
  end
end
