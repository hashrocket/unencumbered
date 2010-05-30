if defined?(RSpec)
  class RSpec::Core::ExampleGroup
    class << self
      alias_method :Feature, :describe

      def executes(scope=:all, &block)
        before(scope, &block)
      end
    end

    %w(Scenario: Given When Background).each do |group|
      method_name = group.sub(":", "")
      module_eval(<<-END_RUBY, __FILE__, __LINE__)
        def self.#{method_name}(*args, &example_group_block)
          describe(#{group.inspect}, *args, &example_group_block)
        end
      END_RUBY
    end

    %w(Then And But).each do |type|
      module_eval(<<-END_RUBY, __FILE__, __LINE__)
        def self.#{type}(desc=nil, options={}, &block)
          example("#{type} \#{desc}", options, &block)
        end
      END_RUBY
    end
  end
end
