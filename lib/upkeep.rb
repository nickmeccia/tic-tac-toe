def did_anyone_win board, winner
  if board[0] == "x" && board[1] == "x" && board[2] == "x"
    winner = "x"
    return winner
  end
  if board[3] == "x" && board[4] == "x" && board[5] == "x"
    winner = "x"
    return winner
  end
  if board[6] == "x" && board[7] == "x" && board[8] == "x"
    winner = "x"
    return winner
  end
  if board[0] == "x" && board[3] == "x" && board[6] == "x"
    winner = "x"
    return winner
  end
  if board[1] == "x" && board[4] == "x" && board[7] == "x"
    winner = "x"
    return winner
  end
  if board[2] == "x" && board[5] == "x" && board[8] == "x"
    winner = "x"
    return winner
  end
  if board[0] == "x" && board[4] == "x" && board[8] == "x"
    winner = "x"
    return winner
  end
  if board[2] == "x" && board[4] == "x" && board[6] == "x"
    winner = "x"
    return winner
  end
        
  if board[0] == "o" && board[1] == "o" && board[2] == "o"
    winner = "o"
    return winner
  end
  if board[3] == "o" && board[4] == "o" && board[5] == "o"
    winner = "o"
    return winner
  end
  if board[6] == "o" && board[7] == "o" && board[8] == "o"
    winner = "o"
    return winner
  end
  if board[0] == "o" && board[3] == "o" && board[6] == "o"
    winner = "o"
    return winner
  end
  if board[1] == "o" && board[4] == "o" && board[7] == "o"
    winner = "o"
    return winner
  end
  if board[2] == "o" && board[5] == "o" && board[8] == "o"
    winner = "o"
    return winner
  end
  if board[0] == "o" && board[4] == "o" && board[8] == "o"
    winner = "o"
    return winner
  end
  if board[2] == "o" && board[4] == "o" && board[6] == "o"    
    winner = "o"
    return winner
  end
        
  if winner == "your mom"  
    return false 
  end
end

def print_board board
  puts "\n#{board[0]} | #{board[1]} | #{board[2]}\n----------\n#{board[3]} | #{board[4]} | #{board[5]}\n----------\n#{board[6]} | #{board[7]} | #{board[8]}\n "
end