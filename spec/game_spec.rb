require_relative "../lib/game.rb"

describe Game do
  it "begins with an empty board" do
    game = Game.new
    game.board.should == ["", "", "", "", "", "", "", "", ""]
  end

  it "knows if a user's team input is valid" do
    game = Game.new
    game.valid_team?("x").should be_true
  end

  it "sets the player and compy teams" do
    game = Game.new
    game.set_teams("x")
    game.player_team.should == "x" and game.compy_team.should == "o"
  end

  it "x makes a move in the center" do
    game = Game.new
    game.make_move(4, "x")
    game.board.should == ["", "", "", "", "x", "", "", "", ""]
  end

  it "checks if a move within the bounds of the board array is valid" do
    game = Game.new
    game.valid_move?(3).should be_true
  end

  it "checks if a move with a decimal value is invalid" do
    game = Game.new
    game.valid_move?(2.2).should be_false
  end  

  it "checks if a move higher than the bounds of the board array is invalid" do
    game = Game.new
    game.valid_move?(10).should be_false
  end

  it "checks if a move lower than the bounds of the board array is invalid" do
    game = Game.new
    game.valid_move?(-1).should be_false
  end

  it "checks if a move that is a string is invalid" do
    game = Game.new
    game.valid_move?("asdf").should be_false
  end

  it "denies a move to an occupied space" do
    game = Game.new
    game.make_move(0, "x")
    game.valid_move?(0).should be_false
  end

  it "does not win if it shouldn't" do
    game = Game.new
    game.set_teams("x")
    game.make_move(0, "o")
    game.make_move(1, "o")
    game.make_move(2, "x")
    game.try_to_win.should be_false
  end

  it "does win if it should" do
    game = Game.new
    game.set_teams("x")
    game.make_move(0, "o")
    game.make_move(1, "o")
    game.make_move(8, "x")
    game.try_to_win.should be_true
  end
  
  it "will not block a player if it shouldn't" do
    game = Game.new
    game.set_teams("x")
    game.make_move(0, "x")
    game.make_move(1, "o")
    game.make_move(8, "o")
    game.block_player.should be_false    
  end

  it "will block a player if it should" do
    game = Game.new
    game.set_teams("x")
    game.make_move(0, "x")
    game.make_move(1, "x")
    game.make_move(8, "o")
    game.block_player.should be_true    
  end
  
  it "chooses the center if the player goes first" do
    game = Game.new
    game.set_teams("x")
    first_player = game.player_team
    game.make_move(0, "x")
    game.make_defensive_move
    game.board.should == ["x", "", "", "", "o", "", "", "", ""]
  end
  
  it "chooses a random space if the player goes first and the center has been chosen" do
    game = Game.new
    game.set_teams("x")
    first_player = game.player_team
    game.make_move(0, "x")
    game.make_defensive_move
    game.board.should == ["x", "", "", "", "o", "", "", "", ""]    
    game.make_move(7, "x")
  end


  context "game over" do
    it "tells us if the game is not over" do
      game = Game.new
      game.over?.should be_false
    end

    # 1 2 3
    # 4 5 6
    # 7 8 9
    it "determines if the game has been won" do
      game = Game.new
      game.make_move(0, "o")
      game.make_move(1, "o")
      game.make_move(2, "o")
      game.won?.should be_true
    end

    it "determines if the game has been won" do
      game = Game.new
      game.make_move(3, "o")
      game.make_move(4, "o")
      game.make_move(5, "o")
      game.won?.should be_true
    end

    it "determines if the game has been won" do
      game = Game.new
      game.make_move(6, "o")
      game.make_move(7, "o")
      game.make_move(8, "o")
      game.won?.should be_true
    end

    it "determines if the game has been won" do
      game = Game.new
      game.make_move(0, "o")
      game.make_move(3, "o")
      game.make_move(6, "o")
      game.won?.should be_true
    end

    it "determines if the game has been won" do
      game = Game.new
      game.make_move(1, "o")
      game.make_move(4, "o")
      game.make_move(7, "o")
      game.won?.should be_true
    end

    it "determines if the game has been won" do
      game = Game.new
      game.make_move(2, "o")
      game.make_move(5, "o")
      game.make_move(8, "o")
      game.won?.should be_true
    end

    it "determines if the game has been won" do
      game = Game.new
      game.make_move(0, "o")
      game.make_move(4, "o")
      game.make_move(8, "o")
      game.won?.should be_true
    end

    it "determines if the game has been won" do
      game = Game.new
      game.make_move(2, "o")
      game.make_move(4, "o")
      game.make_move(6, "o")
      game.won?.should be_true
    end

    it "tells us if this one specific game is a draw" do
      # o x x
      # x o o
      # o o x
      game = Game.new
      game.make_move(0, "o")
      game.make_move(1, "x")
      game.make_move(2, "x")
      game.make_move(3, "x")
      game.make_move(4, "o")
      game.make_move(5, "o")
      game.make_move(6, "o")
      game.make_move(7, "o")
      game.make_move(8, "x")
      game.draw?.should be_true
    end

    it "knows that the game is over" do
      game = Game.new
      game.make_move(0, "o")
      game.make_move(1, "o")
      game.make_move(3, "o")
      game.over?.should be_false
    end
  end

  context "rows, columns, & diagonals" do
    it "has 3 rows" do
      game = Game.new
      game.rows.size.should == 3
    end
    
    it "returns the first row" do
      game = Game.new
      game.make_move(0, "o")
      game.make_move(1, "x")
      game.make_move(2, "o")
      game.rows[0].should == ["o", "x", "o"]
    end
    
    it "returns the second row" do
      game = Game.new
      game.make_move(3, "x")
      game.make_move(4, "x")
      game.make_move(5, "o")
      game.rows[1].should == ["x", "x", "o"] 
    end

    it "returns the third row" do
      game = Game.new
      game.make_move(6, "o")
      game.make_move(7, "x")
      game.make_move(8, "x")
      game.rows[2].should == ["o", "x", "x"] 
    end
    
    it "has 3 columns" do
      game = Game.new
      game.columns.size.should == 3
    end
    
    it "returns the first column" do
      game = Game.new
      game.make_move(0, "o")
      game.make_move(3, "x")
      game.make_move(6, "o")
      game.columns[0].should == ["o", "x", "o"]
    end
    
    it "returns the second columns" do
      game = Game.new
      game.make_move(1, "x")
      game.make_move(4, "x")
      game.make_move(7, "o")
      game.columns[1].should == ["x", "x", "o"] 
    end

    it "returns the third row" do
      game = Game.new
      game.make_move(2, "o")
      game.make_move(5, "x")
      game.make_move(8, "x")
      game.columns[2].should == ["o", "x", "x"] 
    end
    
    it "has 2 diagonals" do
      game = Game.new
      game.diagonals.size.should == 2
    end
    
    it "returns the first diagonal" do
      game = Game.new
      game.make_move(0, "o")
      game.make_move(4, "x")
      game.make_move(8, "o")
      game.diagonals[0].should == ["o", "x", "o"]
    end
    
    it "returns the second diagonal" do
      game = Game.new
      game.make_move(2, "x")
      game.make_move(4, "x")
      game.make_move(6, "o")
      game.diagonals[1].should == ["x", "x", "o"] 
    end
  end
end