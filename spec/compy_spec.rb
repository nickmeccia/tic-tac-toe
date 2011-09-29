require_relative "../lib/compy.rb"
require "board"

describe "Compy" do
  
  it "blocks the other player from winning with a move in the right column" do
    board = Board.new("o", "x")
    comp = Compy.new("o")
    board.set_cell(0, "x")
    board.set_cell(1, "x")
    comp.move_for(board).should == 2
  end
  
  it "blocks the other player from winning with a move in the right column" do
    board = Board.new("o", "x")
    comp = Compy.new("o")
    board.set_cell(3, "x")
    board.set_cell(4, "x")
    comp.move_for(board).should == 5
  end
  
  it "blocks the other player from winning with a move in the right column" do
    board = Board.new("o", "x")
    comp = Compy.new("o")
    board.set_cell(6, "x")
    board.set_cell(7, "x")
    comp.move_for(board).should == 8
  end

  it "blocks the other player from winning with a move in the middle column" do
    board = Board.new("o", "x")
    comp = Compy.new("o")
    board.set_cell(0, "x")
    board.set_cell(2, "x")
    comp.move_for(board).should == 1
  end

  it "blocks the other player from winning with a move in the middle column" do
    board = Board.new("o", "x")
    comp = Compy.new("o")
    board.set_cell(3, "x")
    board.set_cell(5, "x")
    comp.move_for(board).should == 4
  end

  it "blocks the other player from winning with a move in the middle column" do
    board = Board.new("o", "x")
    comp = Compy.new("o")
    board.set_cell(6, "x")
    board.set_cell(8, "x")
    comp.move_for(board).should == 7
  end

  it "blocks the other player from winning with a move in the left column" do
    board = Board.new("o", "x")
    comp = Compy.new("o")
    board.set_cell(1, "x")
    board.set_cell(2, "x")
    comp.move_for(board).should == 0
  end

  it "blocks the other player from winning with a move in the left column" do
    board = Board.new("o", "x")
    comp = Compy.new("o")
    board.set_cell(4, "x")
    board.set_cell(5, "x")
    comp.move_for(board).should == 3
  end

  it "blocks the other player from winning with a move in the left column" do
    board = Board.new("o", "x")
    comp = Compy.new("o")
    board.set_cell(7, "x")
    board.set_cell(8, "x")
    comp.move_for(board).should == 6
  end
end