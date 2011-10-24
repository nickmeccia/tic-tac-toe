class Minimax < Player
  def move_for(board)
    get_max_move(board).position
  end
  

  def get_max_move(board)
    current_max_move = Move.new(0, -1)
    board.remaining_moves.each do |remaining_move|
      new_board = board.copy
      new_board.set_cell(remaining_move, team)
      return Move.new(remaining_move, 1) if player_won?(team, new_board)
      return Move.new(remaining_move, 0) if new_board.cells.all? { |cell| cell == new_board.player_one || cell == new_board.player_two }
      return Move.new(remaining_move, -1) if player_won?(new_board.opponent_for(team), new_board)
      new_rating = get_min_move(new_board).rating
      if new_rating > current_max_move.rating
        current_max_move = Move.new(remaining_move, new_rating)
      end
    end
    return current_max_move
  end

  def get_min_move(board)
    current_min_move = Move.new(0, 1)
    board.remaining_moves.each do |remaining_move|
      new_board = board.copy
      new_board.set_cell(remaining_move, new_board.opponent_for(team));
      return Move.new(current_min_move.position, 1) if player_won?(team, new_board)
      return Move.new(current_min_move.position, 0) if new_board.cells.all? { |cell| cell == new_board.player_one || cell == new_board.player_two }
      return Move.new(current_min_move.position, -1) if player_won?(new_board.opponent_for(team), new_board)
      new_rating = get_max_move(new_board).rating
      if new_rating < current_min_move.rating
        current_min_move = Move.new(remaining_move, new_rating)
      end
    end
    return current_min_move
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