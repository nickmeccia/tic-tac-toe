require 'nick_tac_toe/board'

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
    toggle_current_player
  end
  
  def over?
    return true if draw? || won?
  end

  def draw?
    return false if won?
    return board.cells.all? {|cell| cell == @player_one.team || cell == @player_two.team }
  end
  
  def won?
    return true if board.rows.any? { |row| winner_in_group(row) }
    return true if board.columns.any? { |column| winner_in_group(column) }
    return true if board.diagonals.any? { |diagonal| winner_in_group(diagonal) }
  end
  
  def winner_in_group(group)
    group == [@player_two.team]*3 || group == [@player_one.team]*3
  end
  
  def player_won?(player)
    return true if board.rows.any? { |row| row == [player.team]*3 }
    return true if board.columns.any? { |column| column == [player.team]*3 }
    return true if board.diagonals.any? { |diagonal| diagonal == [player.team]*3 }
  end
  
  private
  
  def toggle_current_player
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end 
  end
end