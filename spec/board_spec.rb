require_relative "../lib/board.rb"

describe Board do
  it "has a team for the computer player" do
    board = Board.new("o", "x")
    board.player_one.should == "o"
  end
  
  it "has a team for the opponent" do
    board = Board.new("o", "x")
    board.player_two.should == "x"
  end
  
  it "gets a cell" do
    board = Board.new("o", "x")
    board.get_cell(0).should == ""
  end
  
  it "sets a cell" do
    board = Board.new("o", "x")
    board.set_cell(0, "x")
    board.get_cell(0).should == "x"
  end
  
  it "returns the board as rows" do
    board = Board.new("o", "x")
    board.set_cell(0, "x")
    board.set_cell(3, "x")
    board.set_cell(6, "x")    
    board.rows.should == [["x", "", ""],["x", "", ""],["x", "", ""]]
  end

  it "returns the board as coulmns" do
    board = Board.new("o", "x")
    board.set_cell(0, "x")
    board.set_cell(3, "x")
    board.set_cell(6, "x")    
    board.columns.should == [["x", "x", "x"],["", "", ""],["", "", ""]]
  end

  it "returns the board as diagonals" do
    board = Board.new("o", "x")
    board.set_cell(0, "x")
    board.set_cell(3, "x")
    board.set_cell(6, "x")    
    board.diagonals.should == [["x", "", ""],["", "", "x"]]
  end
  
  it "is valid for an in range move on an empty board" do
    board = Board.new("o", "x")
    board.valid_move?(3).should be_true
  end

  it "is not valid for a move out of range on an empty board" do
    board = Board.new("o", "x")
    board.valid_move?(-1).should be_false
  end

  it "is not valid for a move to a space that is not empty" do
    board = Board.new("o", "x")
    board.set_cell(4, "x")
    board.valid_move?(5).should be_false
  end

  it "is not valid for a string to be a move" do
    board = Board.new("o", "x")
    board.valid_move?("s").should be_false
  end

  context "blocking_group_for" do
    before(:each) do
      @board = Board.new("o", "x")
    end

    it "finds the first row as a blocking group" do
      @board.set_cell(0, "x")
      @board.set_cell(1, "x")
      @board.blocking_group_for("o").should == [0,1,2]
    end
  
    it "returns nothing if there is nowhere to block" do
      @board.blocking_group_for("o").should == nil
    end
  
    it "returns the second row" do
      @board.set_cell(3, "x")
      @board.set_cell(4, "x")
      @board.blocking_group_for("o").should == [3,4,5]
    end
  
    it "returns the second row if you can block in the center" do
      @board.set_cell(3, "x")
      @board.set_cell(5, "x")
      @board.blocking_group_for("o").should == [3,4,5]
    end
  
    it "returns a blocking row for the other team" do
      @board.set_cell(3, "o")
      @board.set_cell(5, "o")
      @board.blocking_group_for("x").should == [3,4,5]
    end
  
    it "does not return a row that is full" do
      @board.set_cell(3, "o")
      @board.set_cell(4, "x")
      @board.set_cell(5, "o")
      @board.blocking_group_for("x").should == nil
    end

    it "finds the first column as a blocking group" do
      @board.set_cell(0, "x")
      @board.set_cell(3, "x")
      @board.blocking_group_for("o").should == [0,3,6]
    end
  
    it "finds the second column as a blocking group" do
      @board.set_cell(1, "x")
      @board.set_cell(4, "x")
      @board.blocking_group_for("o").should == [1,4,7]
    end
  
    it "finds the third column as a blocking group" do
      @board.set_cell(2, "x")
      @board.set_cell(5, "x")
      @board.blocking_group_for("o").should == [2,5,8]
    end
  
    it "finds the first diagonal as a blocking group" do
      @board.set_cell(0, "x")
      @board.set_cell(4, "x")
      @board.blocking_group_for("o").should == [0,4,8]
    end
  
    it "finds the other diagonal as a blocking group" do
      @board.set_cell(2, "x")
      @board.set_cell(4, "x")
      @board.blocking_group_for("o").should == [2,4,6]
    end
  end
  
  context "empty_spot_in_group" do
    before(:each) do
      @board = Board.new("o", "x")
    end
    
    it "returns the first spot" do
      @board.set_cell(1, "x")
      @board.set_cell(2, "o")
      @board.empty_spot_in_group([0,1,2]).should == 0
    end

    it "returns the first spot" do
      @board.set_cell(0, "x")
      @board.set_cell(2, "o")
      @board.empty_spot_in_group([0,1,2]).should == 1
    end
    
    it "returns the third spot" do
      @board.set_cell(2, "x")
      @board.set_cell(4, "o")
      @board.empty_spot_in_group([2,4,6]).should == 6
    end
    
    it "returns nil if the row is full" do
      @board.set_cell(0, "x")
      @board.set_cell(1, "x")
      @board.set_cell(2, "o")
      @board.empty_spot_in_group([0,1,2]).should == nil
    end
  end
  
  context "winning_group_for" do
    before(:each) do
      @board = Board.new("o", "x")
    end

    it "finds the first row as a winning group" do
      @board.set_cell(0, "x")
      @board.set_cell(1, "x")
      @board.winning_group_for("x").should == [0,1,2]
    end
    
    it "finds the first column as a winning group" do
      @board.set_cell(0, "x")
      @board.set_cell(3, "x")
      @board.winning_group_for("x").should == [0,3,6]
    end
  end

  context "remaining_moves" do
    before(:each) do
      @board = Board.new("o", "x")
    end
    it "calculates the number of remaining moves when there is one spot left" do
      @board.set_cell(0, "x")
      @board.set_cell(1, "x")
      @board.set_cell(2, "o")
      @board.set_cell(3, "x")
      @board.set_cell(4, "x")
      @board.set_cell(5, "o")
      @board.set_cell(6, "x")
      @board.set_cell(7, "x")
      @board.remaining_moves.should == [8]
    end
    
    it "calculates the number of remaining moves when there are two spots left" do
      @board.set_cell(0, "x")
      @board.set_cell(1, "x")
      @board.set_cell(2, "o")
      @board.set_cell(3, "x")
      @board.set_cell(4, "x")
      @board.set_cell(5, "o")
      @board.set_cell(6, "x")
      @board.remaining_moves.should == [7,8]
    end

    it "calculates the number of remaining moves when there are no spots left" do
      @board.set_cell(0, "x")
      @board.set_cell(1, "x")
      @board.set_cell(2, "o")
      @board.set_cell(3, "x")
      @board.set_cell(4, "x")
      @board.set_cell(5, "o")
      @board.set_cell(6, "x")
      @board.set_cell(7, "x")
      @board.set_cell(8, "x")
      @board.remaining_moves.should == []
    end
  end
  
  context "dup" do
    before(:each) do
      @board = Board.new("o", "x")
    end
    it "returns a copy of the board" do
      @board.set_cell(1,"x")
      new_board = @board.copy
      new_board.get_cell(1).should == "x"
    end
    
    it "does not affect the original board when changing the new board" do
      @board.set_cell(1,"x")
      new_board = @board.copy
      new_board.set_cell(0, "o")
      @board.get_cell(0).should_not == "o"
    end

    it "dups players!" do
      new_board = @board.copy
      new_board.player_one = "f"
      @board.player_one.should_not == "f"
    end

  end
end