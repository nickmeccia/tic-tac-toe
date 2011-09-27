require_relative "../lib/board.rb"

describe Board do
  it "gets a cell" do
    board = Board.new
    board.get_cell(0).should == ""
  end
  
  it "sets a cell" do
    board = Board.new
    board.set_cell(0, "x")
    board.get_cell(0).should == "x"
  end
end