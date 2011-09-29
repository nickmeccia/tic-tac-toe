class Compy
  
  attr_reader :team
  
  def initialize team
    @team = team
  end
  
  def move_for(board)
    blocking_group = board.blocking_group_for(@team)
    return board.empty_spot_in_group(blocking_group) if blocking_group
  end
  

end