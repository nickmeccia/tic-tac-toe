require_relative "../lib/minimax.rb"
require "board"

describe "Minimax" do
  before(:each) do
    @board = Board.new("o", "x")
    @minimax = Minimax.new("o")
  end
  
  it "blocks the opponent" do
    @board.set_cell(0, "x")
    @board.set_cell(1, "x")
    @minimax.move_for(@board).should == 2
  end

  xit "should win" do
    @board.set_cell(0, "o")
    @board.set_cell(1, "o")
    @minimax.move_for(@board).should == 2
  end
  
  xit "places a mark in the last available spot on the board" do
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

  it "should place in the top left corner if it goes first" do
    @minimax.move_for(@board).should == 1
  end
  
  xit "should avoid this trap I made!" do
    @board.set_cell(0, "x")
    @board.set_cell(4, "o")
    @board.set_cell(7, "x")
    @minimax.move_for(@board).should_not == 2
  end
  
  xit "should avoid the classic trap!" do
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