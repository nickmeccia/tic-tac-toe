class Game
  
  def initialize
  end

  def over?(board)
    return true if draw?(board) || won?(board)
  end

  def draw?(board)
    board.cells.each do |position|
      return false if position == ""
    end
    return true
  end

  def won?(board)
    return true if board.rows.any? { |row| winner_in_group(row) }
    return true if board.columns.any? { |column| winner_in_group(column) }
    return true if board.diagonals.any? { |diagonal| winner_in_group(diagonal) }
  end

  def winner_in_group(group)
    group == ["o", "o", "o"] || group == ["x", "x", "x"]
  end







  
  def valid_team? input
    if input == "x" || input == "X" || input == "o" || input == "O"
      return true
    else
      return false
    end
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
  
end