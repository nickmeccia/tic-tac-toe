class Compy
  
  attr_reader :team

  def initialize team
    @team = team
  end
  
  def move
    
    
    if @board[0] == @player_team && @board[1] == @player_team && @board[2] != @compy_team
        @board[2] = @compy_team
      return true
    end
    if @board[3] == @player_team && @board[4] == @player_team && @board[5] != @compy_team
      @board[5] = @compy_team
      return true
    end
    
  end

end