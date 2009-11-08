require File.dirname(__FILE__) + '/spec_helper'

describe "A JavaScript Context" do

  before(:each) do
    @context = Snarl::JavascriptContext.new
  end

  it "evaluates JavaScript expressions" do
    @context.eval("1+1").should == 2
  end

  it "loads files into its context for future execution" do
    file = '.jstest'
    open(file, 'w+') { |f| f << "foo = function(i){ return i+1 };" }
    @context.load(file)
    @context.eval("foo(3)").should == 4
    File.delete(file)
  end

  it "sets a value using put" do
    @context.put("foo", "bar")
    @context.eval("foo").should == "bar"
  end

  it "obtains a value using get" do
    @context.eval("foo = 'bar'")
    @context.get("foo").should == "bar"
  end

  it "passes objects in and out using get and put" do
    @context.put("foo", {'foo' => 'bar'})
    @context.get("foo").should == {'foo' => 'bar'}
  end

  it "converts native arrays into ruby arrays" do
    @context.eval("[1,2]").should == [1,2]
  end

  it "converts native objects into ruby objects" do
    @context.eval("foo = function(){return {'foo':'bar'}}; foo();").should == {'foo' => 'bar'}
  end

  it "converts nested objects into ruby objects" do
    @context.eval("foo = function(){return [{'foo':'bar'},{'a':'b'}]}; foo();").should == [{'foo' => 'bar'},{'a' => 'b'}]
  end

  it "converts boolean types into ruby booleans" do
    @context.eval("true").should be_true
    @context.eval("false").should be_false
  end

end
