require "spec_helper"

describe AutoAutoloader do
  it "works" do
    require_relative "test_class"
    expect(TestClass::SubClass.call_to_sub_class).to eq "test"
  end
end
