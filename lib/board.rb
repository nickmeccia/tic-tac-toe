class Board
  
  attr_reader :player_one, :player_two
    
  def initialize(player_one, player_two)
    @cells = [empty_spot]*9
    @player_one = player_one
    @player_two = player_two
  end

  def get_cell position
    @cells[position]
  end

  def set_cell position, team
    @cells[position] = team
  end
  
  def rows
    [@cells[0..2], @cells[3..5], @cells[6..8]]
  end

  def columns
    [
      [@cells[0], @cells[3], @cells[6]],
      [@cells[1], @cells[4], @cells[7]],
      [@cells[2], @cells[5], @cells[8]]
    ]
  end
  
  def diagonals
    [
      [@cells[0], @cells[4], @cells[8]],
      [@cells[2], @cells[4], @cells[6]],
    ]
  end
  
  def blocking_group_for(team)
    3.times do |i| # rows
      return [3*i, 3*i + 1, 3*i + 2] if rows[i].sort == [empty_spot, opponent_for(team), opponent_for(team)]
    end

    3.times do |i| # columns
      return [i, i + 3, i + 6] if columns[i].sort == [empty_spot, opponent_for(team), opponent_for(team)]
    end
    
    return [0, 4, 8] if diagonals[0].sort == [empty_spot, opponent_for(team), opponent_for(team)]
    return [2, 4, 6] if diagonals[1].sort == [empty_spot, opponent_for(team), opponent_for(team)]

    return nil
  end
  
  def empty_spot_in_group(group)
    empty_spots = group.select do |position|
      get_cell(position) == empty_spot
    end
    return empty_spots.first
  end
  
  def winning_group_for(team)
    blocking_group_for(opponent_for(team))
  end
  
  private
  
  def empty_spot
    ""
  end
  
  def opponent_for(team)
    if team == @player_one
      return @player_two
    else
      return @player_one
    end
  end
end