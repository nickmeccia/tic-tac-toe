require_relative 'player.rb'

class Compy < Player
  def move_for(board)
    return board.empty_spot_in_group(winning_group(board)) if winning_group(board)
    return board.empty_spot_in_group(blocking_group(board)) if blocking_group(board)
    return board.center if board.empty_at_center?
    return board.first_empty_cell
  end
  
  private #################
  
  def winning_group(board)
    board.winning_group_for(@team)
  end
  
  def blocking_group(board)
    board.blocking_group_for(@team)
  end
end
