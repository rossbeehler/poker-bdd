require_relative '../../poker'

describe HighCardHandType do
  context "comparing types" do
    it "compares highest ranked card" do
      subject1 = HighCardHandType.new(%W(2S 3S 4S 5S 6C))
      subject2 = HighCardHandType.new(%W(2H 3H 4H 5H 7D))
    end
  end
end
