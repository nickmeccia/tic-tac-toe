require_relative 'player.rb'

class Move
  attr_accessor :position, :rating
  def initialize(position, rating)
    @position = position
    @rating = rating
  end
end

class Minimax < Player
  def move_for(board)
    get_max_move(board)#.position
  end
  

  def get_max_move(board)
    # current_max_move = Move.new(nil, -1)
    max_rating = -1
    best_position = 0
#    puts board.remaining_moves.inspect
    board.remaining_moves.each do |remaining_move|
      new_board = board.copy
      new_board.set_cell(remaining_move, team)
#      puts "board: #{board.inspect}"
#      puts "new_board: #{new_board.inspect}"
      return 1 if player_won?(self, new_board)
      return 0 if new_board.cells.all? { |cell| cell == new_board.player_one || cell == new_board.player_two }
      return -1 if player_won?(new_board.opponent_for(self), new_board)
      new_rating = get_min_move(new_board)#.rating
      if new_rating > max_rating
        # current_max_move = Move.new(remaining_move, new_rating)
        max_rating = new_rating
        best_position = remaining_move
      end
    end
    return best_position
  end

  def get_min_move(board)
    # current_min_move = Move.new(nil, nil)
    min_rating = +1
    best_position = 0
    board.remaining_moves.each do |remaining_move|
      new_board = board.copy
      new_board.set_cell(remaining_move, new_board.opponent_for(team));
      return 1 if player_won?(self, new_board)
      return 0 if new_board.cells.all? { |cell| cell == new_board.player_one || cell == new_board.player_two }
      return -1 if player_won?(new_board.opponent_for(self), new_board)
      new_rating = get_max_move(new_board)#.rating
      if new_rating < min_rating
        # current_min_move = Move.new(remaining_move, new_rating)
        min_rating = new_rating
        best_position = remaining_move
      end
    end
    return best_position
  end

  def player_won?(team, board)
    return true if board.rows.any? { |row| row == [team]*3 }
    return true if board.columns.any? { |column| column == [team]*3 }
    return true if board.diagonals.any? { |diagonal| diagonal == [team]*3 }
  end
  

  private #################

  def winning_group(board)
    board.winning_group_for(@team)
  end
  
  def blocking_group(board)
    board.blocking_group_for(@team)
  end
end