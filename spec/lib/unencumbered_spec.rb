require File.expand_path('../../../lib/unencumbered', __FILE__)

describe Spec::DSL::Main do
  class TestBed
    include Spec::DSL::Main
    def initialize
      @description_args = []
    end
  end

  it 'responds to Feature' do
    Spec::DSL::Main.should respond_to(:Feature)
  end

  describe '#narrative' do
    it '#narrative appends the description to description_args' do
      dsl_main = TestBed.new
      dsl_main.instance_variable_get(:@description_args).should_receive(:push).with("\nfoo\n")
      dsl_main.narrative('foo'){}
    end
  end
end

describe Spec::Example::ExampleGroupMethods do
  class TestBed
    include Spec::Example::ExampleGroupMethods
  end

  let(:example_group_methods){ TestBed.new }

  shared_examples_for 'a standard describe proxy' do
    let(:spec_method){ spec_type.gsub(/\:/,'') }

    it 'calls describe' do
      example_group_methods.should_receive(:describe)
      example_group_methods.send(spec_method,'foo'){}
    end

    it "prefaces the description" do
      example_group_methods.should_receive(:describe).with("#{spec_type} foo")
      example_group_methods.send(spec_method,'foo'){}
    end

    it 'passes along the implementation block' do
      impl = lambda{ 'foo' }
      example_group_methods.should_receive(:describe).with(anything,&impl)
      example_group_methods.send(spec_method,'foo',&impl)
    end
  end

  shared_examples_for 'a standard example proxy' do
    it 'calls example' do
      example_group_methods.should_receive(:example)
      example_group_methods.send(spec_method,'foo'){}
    end

    it 'prefaces the description' do
      example_group_methods.should_receive(:example).with("#{spec_method} foo")
      example_group_methods.send(spec_method,'foo'){}
    end
    it 'passes along the implementation block' do
      impl = lambda{ 'foo' }
      example_group_methods.should_receive(:example).with(anything,&impl)
      example_group_methods.send(spec_method,'foo',&impl)
    end
  end

  describe "#Scenario" do
    let(:spec_type){ 'Scenario:' }
    it_should_behave_like 'a standard describe proxy'
  end

  describe "#Given" do
    let(:spec_type){ 'Given' }
    it_should_behave_like 'a standard describe proxy'
  end

  describe "#When" do
    let(:spec_type){ 'When' }
    it_should_behave_like 'a standard describe proxy'
  end

  describe "#Background" do
    let(:spec_type){ 'Background' }
    it_should_behave_like 'a standard describe proxy'
  end

  describe "#Then" do
    let(:spec_method){ 'Then' }
    it_should_behave_like 'a standard example proxy'
  end

  describe "#And" do
    let(:spec_method){ 'And' }
    it_should_behave_like 'a standard example proxy'
  end

  describe "#But" do
    let(:spec_method){ 'But' }
    it_should_behave_like 'a standard example proxy'
  end

  describe '#executes' do
    it 'calls before' do
      example_group_methods.should_receive(:before)
      example_group_methods.send(:executes){}
    end

    it 'defaults the scope to :all' do
      example_group_methods.should_receive(:before).with(:all)
      example_group_methods.send(:executes){}
    end

    it 'allows you to override the scope' do
      example_group_methods.should_receive(:before).with(:each)
      example_group_methods.send(:executes,:each){}
    end

    it 'passes along the implementation block' do
      impl = lambda{ 'foo' }
      example_group_methods.should_receive(:before).with(anything,&impl)
      example_group_methods.send(:executes,&impl)
    end
  end
end
