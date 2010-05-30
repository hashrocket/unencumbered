require 'spec_helper'

describe RSpec::Core::ExampleGroup do
  subject { RSpec::Core::ExampleGroup.describe }

  it "responds to Feature" do
    RSpec::Core::ExampleGroup.should respond_to(:Feature)
  end

  shared_examples_for 'a describe method' do
    let(:spec_method) { spec_type.sub(":", "") }
    let(:description) { 'description' }
    it 'calls describe' do
      subject.should_receive(:describe)
      subject.send(spec_method)
    end
    it 'calls describe with prefix' do
      subject.should_receive(:describe).with(spec_type, description)
      subject.send(spec_method, description)
    end
    it 'calls describe with implementation' do
      impl = lambda { |*args| }
      subject.should_receive(:describe).with(spec_type, description, &impl)
      subject.send(spec_method, description, &impl)
    end
  end

  shared_examples_for 'an example method' do
    let(:description) { 'description' }
    it 'calls example' do
      subject.should_receive(:example)
      subject.send(spec_type)
    end
    it 'calls example with prefix' do
      subject.should_receive(:example).with("#{spec_type} #{description}", {})
      subject.send(spec_type, description)
    end
    it 'calls example with implementation' do
      impl = lambda { |*args| }
      subject.should_receive(:example).with("#{spec_type} #{description}", {}, &impl)
      subject.send(spec_type, description, &impl)
    end
  end

  describe "#Scenario" do
    let(:spec_type) { 'Scenario:' }
    it_should_behave_like 'a describe method'
  end

  describe "#Given" do
    let(:spec_type) { 'Given' }
    it_should_behave_like 'a describe method'
  end

  describe "#When" do
    let(:spec_type) { 'When' }
    it_should_behave_like 'a describe method'
  end

  describe "#Background" do
    let(:spec_type) { 'Background' }
    it_should_behave_like 'a describe method'
  end

  describe "#Then" do
    let(:spec_type) { 'Then' }
    it_should_behave_like 'an example method'
  end

  describe "#And" do
    let(:spec_type) { 'And' }
    it_should_behave_like 'an example method'
  end

  describe "#But" do
    let(:spec_type) { 'But' }
    it_should_behave_like 'an example method'
  end

  describe "#executes" do
    it "calls before with :all scope by default" do
      subject.should_receive(:before).with(:all)
      subject.executes
    end
    it "calls before with scope" do
      subject.should_receive(:before).with(:each)
      subject.executes(:each)
    end
    it "calls before with scope and block" do
      impl = lambda { |*args| }
      subject.should_receive(:before).with(:all, &impl)
      subject.executes &impl
    end
  end
end
