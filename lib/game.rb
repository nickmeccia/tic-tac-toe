class Game
  
  def initialize
    @board = ["", "", "", "", "", "", "", "", ""]
    @player_team = nil
    @compy_team = nil
  end

  def board
    @board
  end
  
  def player_team
    @player_team
  end
  
  def compy_team
    @compy_team
  end
  
  


  def valid_team? input
    if input == "x" || input == "X" || input == "o" || input == "O"
      return true
    else
      return false
    end
  end
      
  def make_move(position, team)
    @board[position] = team
  end

  def set_teams team_choice
    if team_choice == "x" || team_choice == "X"
      @player_team = "x"
      @compy_team = "o"
    elsif team_choice == "o" || team_choice == "O"
      @player_team == "o"
      @compy_team ="x"
    else
      return
    end
  end  
  
  def valid_move?(position)
    if [1,2,3,4,5,6,7,8,9].include?(position)
      if @board[position-1] != @compy_team && @board[position-1] != @player_team
        return true
      end
    else
      return false
    end
  end
  
  
  
  def try_to_win
    # horizontal
    if @board[0] == @compy_team && @board[1] == @compy_team && @board[2] != @player_team
      @board[2] = @compy_team
      return true
    end
    if @board[1] == @compy_team && @board[2] == @compy_team && @board[0] != @player_team
      @board[0] = @compy_team
      return true
    end
    if @board[0] == @compy_team && @board[2] == @compy_team && @board[1] != @player_team
      @board[1] = @compy_team
      return true
    end
    if @board[3] == @compy_team && @board[4] == @compy_team && @board[5] != @player_team
      @board[5] = @compy_team
      return true
    end
    if @board[3] == @compy_team && @board[5] == @compy_team && @board[4] != @player_team
      @board[4] = @compy_team
      return true
    end
    if @board[4] == @compy_team && @board[5] == @compy_team && @board[3] != @player_team
      @board[3] = @compy_team
      return true
    end
    if @board[6] == @compy_team && @board[7] == @compy_team && @board[8] != @player_team
      @board[8] = @compy_team
      return true
    end
    if @board[6] == @compy_team && @board[8] == @compy_team && @board[7] != @player_team
      @board[7] = @compy_team
      return true
    end
    if @board[7] == @compy_team && @board[8] == @compy_team && @board[6] != @player_team
      @board[6] = @compy_team
      return true
    end
    # vertical
    if @board[0] == @compy_team && @board[3] == @compy_team && @board[6] != @player_team
      @board[6] = @compy_team
      return true
    end
    if @board[0] == @compy_team && @board[6] == @compy_team && @board[3] != @player_team
      @board[3] = @compy_team
      return true
    end
    if @board[3] == @compy_team && @board[6] == @compy_team && @board[0] != @player_team
      @board[0] = @compy_team
      return true
    end
    if @board[1] == @compy_team && @board[4] == @compy_team && @board[7] != @player_team
      @board[7] = @compy_team
      return true
    end
    if @board[1] == @compy_team && @board[7] == @compy_team && @board[4] != @player_team
      @board[4] = @compy_team
      return true
    end
    if @board[4] == @compy_team && @board[7] == @compy_team && @board[1] != @player_team
      @board[1] = @compy_team
      return true
    end
    if @board[2] == @compy_team && @board[5] == @compy_team && @board[8] != @player_team
      @board[8] = @compy_team
      return true
    end
    if @board[2] == @compy_team && @board[8] == @compy_team && @board[5] != @player_team
      @board[5] = @compy_team
      return true
    end
    if @board[5] == @compy_team && @board[8] == @compy_team && @board[2] != @player_team
      @board[2] = @compy_team
      return true
    end
    # diagonal
    if @board[0] == @compy_team && @board[4] == @compy_team && @board[8] != @player_team
      @board[8] = @compy_team
      return true
    end
    if @board[0] == @compy_team && @board[8] == @compy_team && @board[4] != @player_team
      @board[4] = @compy_team
      return true
    end
    if @board[4] == @compy_team && @board[8] == @compy_team && @board[0] != @player_team
      @board[0] = @compy_team
      return true
    end
    if @board[2] == @compy_team && @board[4] == @compy_team && @board[6] != @player_team
      @board[6] = @compy_team
      return true
    end
    if @board[2] == @compy_team && @board[6] == @compy_team && @board[4] != @player_team
      @board[4] = @compy_team
      return true
    end
    if @board[4] == @compy_team && @board[6] == @compy_team && @board[2] != @player_team
      @board[2] = @compy_team
      return true
    end
    return false
  end
  # 0 1 2
  # 3 4 5
  # 6 7 8

  def block_player

    rows.any? do |row|
      if row == [@player_team, @player_team, ""]
        @board[2] = @compy_team
        return true
      end
    end
        
      
    if rows[0] == [@player_team, @player_team, ""]
      @board[2] = @compy
      return true
    end
    if rows[1] == [@player_team, @player_team, ""]
      @board[5] = @compy
      return true
    end
    if rows[2] == [@player_team, @player_team, ""]
      @board[8] = @compy
      return true
    end
  end

  def asdf_block_player
    # horizontal
    if @board[0] == @player_team && @board[1] == @player_team && @board[2] != @compy_team
        @board[2] = @compy_team
      return true
    end
    if @board[0] == @player_team && @board[2] == @player_team && @board[1] != @compy_team
      @board[1] = @compy_team
      return true
    end
    if @board[1] == @player_team && @board[2] == @player_team && @board[0] != @compy_team
      @board[0] = @compy_team
      return true
    end
    if @board[3] == @player_team && @board[4] == @player_team && @board[5] != @compy_team
      @board[5] = @compy_team
      return true
    end
    if @board[3] == @player_team && @board[5] == @player_team && @board[4] != @compy_team
      @board[4] = @compy_team
      return true
    end
    if @board[4] == @player_team && @board[5] == @player_team && @board[3] != @compy_team
      @board[3] = @compy_team
      return true
    end
    if @board[6] == @player_team && @board[7] == @player_team && @board[8] != @compy_team
      @board[8] = @compy_team
      return true
    end
    if @board[6] == @player_team && @board[8] == @player_team && @board[7] != @compy_team
      @board[7] = @compy_team
      return true
    end
    if @board[7] == @player_team && @board[8] == @player_team && @board[6] != @compy_team
      @board[6] = @compy_team
      return true
    end
    # vertical
    if @board[0] == @player_team && @board[3] == @player_team && @board[6] != @compy_team
      @board[6] = @compy_team
      return true
    end
    if @board[0] == @player_team && @board[6] == @player_team && @board[3] != @compy_team
      @board[3] = @compy_team
      return true
    end
    if @board[3] == @player_team && @board[6] == @player_team && @board[0] != @compy_team
      @board[0] = @compy_team
      return true
    end
    if @board[1] == @player_team && @board[4] == @player_team && @board[7] != @compy_team
      @board[7] = @compy_team
      return true
    end
    if @board[1] == @player_team && @board[7] == @player_team && @board[4] != @compy_team
      @board[4] = @compy_team
      return true
    end
    if @board[4] == @player_team && @board[7] == @player_team && @board[1] != @compy_team
      @board[1] = @compy_team
      return true
    end
    if @board[2] == @player_team && @board[5] == @player_team && @board[8] != @compy_team
      @board[8] = @compy_team
      return true
    end
    if @board[2] == @player_team && @board[8] == @player_team && @board[5] != @compy_team
      @board[5] = @compy_team
      return true
    end
    if @board[5] == @player_team && @board[8] == @player_team && @board[2] != @compy_team
      @board[2] = @compy_team
      return true
    end
    # diagonal
    if @board[0] == @player_team && @board[4] == @player_team && @board[8] != @compy_team
      @board[8] = @compy_team
      return true
    end
    if @board[0] == @player_team && @board[8] == @player_team && @board[4] != @compy_team
      @board[4] = @compy_team
      return true
    end
    if @board[4] == @player_team && @board[8] == @player_team && @board[0] != @compy_team
      @board[0] = @compy_team
      return true
    end
    if @board[2] == @player_team && @board[4] == @player_team && @board[6] != @compy_team
      @board[6] = @compy_team
      return true
    end
    if @board[2] == @player_team && @board[6] == @player_team && @board[4] != @compy_team
      @board[4] = @compy_team
      return true
    end
    if @board[4] == @player_team && board[8] == player_team && board[6] != compy_team
      @board[6] = @compy_team
      return true
    end
    return false
  end
  

  def make_offensive_move
  end
  
  def make_defensive_move
    if @board[4] != @compy_team && @board[4] != @player_team
      @board[4] = @compy_team
      return true
    end
    return false    
  end
  
  
  
  def print
    list = []
    @board.each_with_index do |marker, index|
      if marker == ""
        list << index+1
      else
        list << marker
      end
    end
    puts "\n#{list[0]} | #{list[1]} | #{list[2]}\n----------\n#{list[3]} | #{list[4]} | #{list[5]}\n----------\n#{list[6]} | #{list[7]} | #{list[8]}\n "
  end
 
  # 0 1 2
  # 3 4 5
  # 6 7 8

  
  def rows
    [@board[0..2], @board[3..5], @board[6..8]]
  end

  def columns
    [
      [@board[0], @board[3], @board[6]],
      [@board[1], @board[4], @board[7]],
      [@board[2], @board[5], @board[8]]
    ]
  end
  
  def diagonals
    [
      [@board[0], @board[4], @board[8]],
      [@board[2], @board[4], @board[6]],
    ]
  end
  
  def over?
    return true if @draw? == true || @won? == true
  end

  def draw?
    @board.each do |position|
      return false if position == ""
    end
    return true
  end

  def won?
    return true if rows.any? { |row| winner_in_group(row) }
    return true if columns.any? { |column| winner_in_group(column) }
    return true if diagonals.any? { |diagonal| winner_in_group(diagonal) }
  end
  
  def winner_in_group(group)
    group == ["o", "o", "o"] || group == ["x", "x", "x"]
  end
end
