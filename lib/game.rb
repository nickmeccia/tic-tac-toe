require_relative 'board.rb'

class Game
  attr_reader :board, :current_player

  def initialize(player_one, player_two)
    @board = Board.new(player_one.team, player_two.team)
    @player_one = player_one
    @player_two = player_two
    @current_player = player_one
  end
  
  def take_next_turn
    make_move(current_player.move_for(board))
  end
  
  def make_move(position)
    @board.set_cell(position, current_player.team)
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end 
  end
  
  def over?
    return true if draw? || won?
  end

  def draw?
    board.cells.each do |position|
      return false if position == ""
    end
    return true
  end

  def won?
    return true if board.rows.any? { |row| winner_in_group(row) }
    return true if board.columns.any? { |column| winner_in_group(column) }
    return true if board.diagonals.any? { |diagonal| winner_in_group(diagonal) }
  end

  def winner_in_group(group)
    group == ["o", "o", "o"] || group == ["x", "x", "x"]
  end
  
  def valid_team?(input)
    if input == "x" || input == "X" || input == "o" || input == "O"
      return true
    else
      return false
    end
  end

  def set_teams(team_choice)
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
end