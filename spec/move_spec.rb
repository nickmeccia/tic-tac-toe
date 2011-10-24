require "nick_tac_toe"

describe Move do
  it "has a position" do
    move = Move.new("position", nil)
    move.position.should == "position"
  end
  
  it "has a rating" do
    move = Move.new(nil, "rating")
    move.rating.should == "rating" 
  end
end