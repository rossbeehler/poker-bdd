require_relative '../poker'

describe HandTypeFactory do
  it "creates high card hands" do
    HandTypeFactory.create(%W(2S 3S 4S 5S 6C)).class.should == HighCardHandType
  end
end
