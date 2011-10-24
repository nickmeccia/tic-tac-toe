require "nick_tac_toe"

describe "Game" do
  
  before(:each) do
    @player_one = Human.new("x")
    @player_two = Human.new("o")
    @game = Game.new(@player_one, @player_two)
  end

  context "Game over" do
    it "starts with player one as the current player" do
      @game.current_player.should == @player_one
    end
    
    it "makes a move on the board" do
      @game.make_move(1)
      @game.board.get_cell(1).should == @player_one.team
    end
    
    it "makes a move using player twos team" do
      @game.make_move(1)
      @game.make_move(2)
      @game.board.get_cell(2).should == @player_two.team
    end
    
    it "switches to player two's turn" do
      @game.make_move(2)
      @game.current_player.should == @player_two
    end
    
    it "switches back to player one" do
      @game.make_move(2)
      @game.make_move(2)
      @game.current_player.should == @player_one
    end
    
    it "does not call the game a draw if the board is not full" do
      @game.board.set_cell(0, "x")
      @game.draw?.should be_false
    end
    
    it "is not a draw if the game is full with a winner" do
      @game.board.set_cell(0, "o")
      @game.board.set_cell(1, "o")
      @game.board.set_cell(2, "o")
      @game.board.set_cell(3, "o")
      @game.board.set_cell(4, "x")
      @game.board.set_cell(5, "x")
      @game.board.set_cell(6, "o")
      @game.board.set_cell(7, "x")
      @game.board.set_cell(8, "x")
      @game.draw?.should be_false
    end
    
    it "knows that the game a draw if the board is full" do
      # x o x
      # x o o
      # o x x
      @game.board.set_cell(0, "x")
      @game.board.set_cell(1, "o")
      @game.board.set_cell(2, "x")
      @game.board.set_cell(3, "x")
      @game.board.set_cell(4, "o")
      @game.board.set_cell(5, "o")
      @game.board.set_cell(6, "o")
      @game.board.set_cell(7, "x")
      @game.board.set_cell(8, "x")
      @game.draw?.should be_true
    end
    
    it "knows that three horizonal marks is a win" do
      @game.board.set_cell(0, "o")
      @game.board.set_cell(1, "o")
      @game.board.set_cell(2, "o")
      @game.won?.should be_true
    end
    
    it "knows that three vertical marks is a win" do
      @game.board.set_cell(0, "o")
      @game.board.set_cell(3, "o")
      @game.board.set_cell(6, "o")
      @game.won?.should be_true
    end
    
    it "knows that three diagonal marks is a win" do
      @game.board.set_cell(0, "o")
      @game.board.set_cell(4, "o")
      @game.board.set_cell(8, "o")
      @game.won?.should be_true
    end
    
    it "knows if there is not a winner in a group" do
      @game.winner_in_group(["x","x","o"]).should be_false
    end

    it "knows if there is a winner in a group" do
      @game.winner_in_group(["x","x","x"]).should be_true
    end
    
    it "knows if a specific player won in a row" do
      @game.board.set_cell(0, @player_one.team)
      @game.board.set_cell(1, @player_one.team)
      @game.board.set_cell(2, @player_one.team)      
      @game.player_won?(@player_one).should be_true
    end
    
    it "returns false if the other player won in a row" do
      @game.board.set_cell(0, @player_one.team)
      @game.board.set_cell(1, @player_one.team)
      @game.board.set_cell(2, @player_one.team)      
      @game.player_won?(@player_two).should be_false
    end

    it "knows if a specific player won in a column" do
      @game.board.set_cell(0, @player_one.team)
      @game.board.set_cell(3, @player_one.team)
      @game.board.set_cell(6, @player_one.team)      
      @game.player_won?(@player_one).should be_true
    end
    
    it "returns false if the other player won in a column" do
      @game.board.set_cell(0, @player_one.team)
      @game.board.set_cell(3, @player_one.team)
      @game.board.set_cell(6, @player_one.team)      
      @game.player_won?(@player_two).should be_false
    end

    it "knows if a specific player won in a diagonal" do
      @game.board.set_cell(0, @player_one.team)
      @game.board.set_cell(4, @player_one.team)
      @game.board.set_cell(8, @player_one.team)      
      @game.player_won?(@player_one).should be_true
    end
    
    it "returns false if the other player won in a diagonal" do
      @game.board.set_cell(0, @player_one.team)
      @game.board.set_cell(4, @player_one.team)
      @game.board.set_cell(8, @player_one.team)      
      @game.player_won?(@player_two).should be_false
    end
  end
end