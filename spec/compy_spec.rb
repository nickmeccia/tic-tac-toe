require_relative "../lib/compy.rb"
require "board"

describe "Compy" do
  it "initializes a compy player" do
    comp = Compy.new("o")
    comp.team.should == "o"
  end
  
  it "blocks the other player from winning" do
    board = Board.new
    comp = Compy.new("o")
    board.set_cell(0, "x")
    board.set_cell(1, "x")
    comp.move.should == 2
  end
  
  it "actually blocks the player from winning" do
    board = Board.new
    comp = Compy.new("o")
    board.set_cell(3, "x")
    board.set_cell(4, "x")
    comp.move.should == 5
  end
  
  
end