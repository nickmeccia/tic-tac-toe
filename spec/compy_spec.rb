require_relative "../lib/compy.rb"
require "board"

describe "Compy" do
  before(:each) do
    @board = Board.new("o", "x")
    @comp = Compy.new("o")
  end
  
  it "blocks the other player from winning if the only option is blocking" do
    @board.set_cell(0, "x")
    @board.set_cell(1, "x")
    @comp.move_for(@board).should == 2
  end
  
  it "wins if the only option is winning" do
    @board.set_cell(0, "o")
    @board.set_cell(3, "o")
    @comp.move_for(@board).should == 6
  end

  it "prefers winning to blocking" do
    # | x | o |   |
    # | x | o |   |
    # |   |   |   |
    @board.set_cell(0, "x")
    @board.set_cell(1, "o")
    @board.set_cell(3, "x")
    @board.set_cell(4, "o")
    
    @comp.move_for(@board).should == 7
  end
  
  it "chooses the center if it cannot win or block" do
    @comp.move_for(@board).should == 4
  end
  
  it "chooses the first open spot when the center is taken" do
    @board.set_cell(4,"o")
    @comp.move_for(@board).should == 0
  end
  
  it "chooses a different open spot" do
    @board.set_cell(0,"o")
    @board.set_cell(4,"x")
    @comp.move_for(@board).should == 1
  end
end
