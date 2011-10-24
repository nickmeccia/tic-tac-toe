require "nick_tac_toe"

describe "Minimax" do
  before(:each) do
    @board = Board.new("o", "x")
    @minimax = Minimax.new("o")
  end
  
  it "blocks the opponent" do
    # o - -
    # x x -
    # - - -
    @board.set_cell(0, "o")
    @board.set_cell(3, "x")
    @board.set_cell(4, "x")
    @minimax.move_for(@board).should == 5
  end

  xit "should win" do
    @board.set_cell(0, "o")
    @board.set_cell(1, "o")
    @minimax.move_for(@board).should == 2
  end
  
  it "places a mark in the last available spot on the board" do
    # 0 1 2     x x o
    # 3 4 5     o o x
    # 6 7 8     x o x
    @board.set_cell(0, "x")
    @board.set_cell(1, "x")
    @board.set_cell(2, "o")
    @board.set_cell(3, "o")
    @board.set_cell(4, "o")
    @board.set_cell(5, "x")
    @board.set_cell(6, "x")
    @board.set_cell(8, "x")
    @minimax.move_for(@board).should == 7
  end

  xit "places in the top left corner if it goes first" do
    @minimax.move_for(@board).should == 0
  end
  
  it "avoids this trap I made!" do
    # x 1 2
    # 3 o 5
    # 6 x 8
    @board.set_cell(0, "x")
    @board.set_cell(4, "o")
    @board.set_cell(7, "x")
    @minimax.move_for(@board).should == 3
  end
  
  it "avoids the classic trap!" do
    @board.set_cell(0, "x")
    @minimax.move_for(@board).should == 4    
  end

  it "should avoid stage 2 of the classic trap!" do
    @board.set_cell(0, "x")
    @board.set_cell(4, "o")
    @board.set_cell(8, "x")
    @minimax.move_for(@board).should_not == 2    
  end
  
  it "should avoid stage 2 of the classic trap part 2!" do
    @board.set_cell(0, "x")
    @board.set_cell(4, "o")
    @board.set_cell(8, "x")
    @minimax.move_for(@board).should_not == 6
  end
end