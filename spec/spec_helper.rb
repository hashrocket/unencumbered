require File.expand_path('../../lib/unencumbered', __FILE__)

RSpec.configure do |c|
  c.before(:each) do
    @real_world = RSpec.world
    RSpec.instance_variable_set(:@world, RSpec::Core::World.new)
  end
  c.after(:each) do
    RSpec.instance_variable_set(:@world, @real_world)
  end
end
