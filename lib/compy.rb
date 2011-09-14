def try_to_win board, compy_team, player_team
  if board[0] == compy_team && board[1] == compy_team
    board[2] = compy_team
    return board
  end
  if board[1] == compy_team && board[2] == compy_team
      board[0] = compy_team
      return board
  end
  if board[3] == compy_team && board[4] == compy_team
      board[5] = compy_team
      return board
  end
  if board[4] == compy_team && board[5] == compy_team
      board[3] = compy_team
      return board
  end
  if board[6] == compy_team && board[7] == compy_team
      board[8] = compy_team
      return board
  end
  if board[7] == compy_team && board[8] == compy_team
      board[6] = compy_team
      return board
  end




  if board[0] == compy_team && board[3] == compy_team
      board[6] = compy_team
      return board
  end
  if board[3] == compy_team && board[6] == compy_team
      board[0] = compy_team
      return board
  end
  if board[1] == compy_team && board[4] == compy_team
      board[7] = compy_team
      return board
  end
  if board[4] == compy_team && board[7] == compy_team
      board[1] = compy_team
      return board
  end
  if board[2] == compy_team && board[5] == compy_team
      board[8] = compy_team
      return board
  end
  if board[5] == compy_team && board[8] == compy_team
      board[2] = compy_team
      return board
  end



  
  if board[0] == compy_team && board[4] == compy_team
      board[8] = compy_team
      return board
  end
  if board[4] == compy_team && board[8] == compy_team
      board[0] = compy_team
      return board
  end
  if board[2] == compy_team && board[4] == compy_team
      board[6] = compy_team
      return board
  end
  if board[4] == compy_team && board[8] == compy_team
      board[6] = compy_team
      return board
  end

  

  if board[0] == compy_team && board[2] == compy_team
      board[1] = compy_team
      return board
  end
  if board[3] == compy_team && board[5] == compy_team
      board[4] = compy_team
      return board
  end
  if board[6] == compy_team && board[8] == compy_team
      board[7] = compy_team
      return board
  end
  if board[0] == compy_team && board[6] == compy_team
      board[3] = compy_team
      return board
  end
  if board[1] == compy_team && board[7] == compy_team
      board[4] = compy_team
      return board
  end
  if board[2] == compy_team && board[8] == compy_team
      board[5] = compy_team
      return board
  end
  if board[0] == compy_team && board[8] == compy_team
      board[4] = compy_team
      return board
  end
  if board[2] == compy_team && board[6] == compy_team
      board[4] = compy_team
      return board
  end
  
  return board
end

#    012
#    345
#    678

##################################################################

def block_player board, compy_team, player_team
  if board[0] == player_team && board[1] == player_team
    board[2] = compy_team
    return board
  end
  if board[1] == player_team && board[2] == player_team
      board[0] = compy_team
      return board
  end
  if board[3] == player_team && board[4] == player_team
      board[5] = compy_team
      return board
  end
  if board[4] == player_team && board[5] == player_team
      board[3] = compy_team
      return board
  end
  if board[6] == player_team && board[7] == player_team
      board[8] = compy_team
      return board
  end
  if board[7] == player_team && board[8] == player_team
      board[6] = compy_team
      return board
  end




  if board[0] == player_team && board[3] == player_team
      board[6] = compy_team
      return board
  end
  if board[3] == player_team && board[6] == player_team
      board[0] = compy_team
      return board
  end
  if board[1] == player_team && board[4] == player_team
      board[7] = compy_team
      return board
  end
  if board[4] == player_team && board[7] == player_team
      board[1] = compy_team
      return board
  end
  if board[2] == player_team && board[5] == player_team
      board[8] = compy_team
      return board
  end
  if board[5] == player_team && board[8] == player_team
      board[2] = compy_team
      return board
  end



  
  if board[0] == player_team && board[4] == player_team
      board[8] = compy_team
      return board
  end
  if board[4] == player_team && board[8] == player_team
      board[0] = compy_team
      return board
  end
  if board[2] == player_team && board[4] == player_team
      board[6] = compy_team
      return board
  end
  if board[4] == player_team && board[8] == player_team
      board[6] = compy_team
      return board
  end

  

  if board[0] == player_team && board[2] == player_team
      board[1] = compy_team
      return board
  end
  if board[3] == player_team && board[5] == player_team
      board[4] = compy_team
      return board
  end
  if board[6] == player_team && board[8] == player_team
      board[7] = compy_team
      return board
  end
  if board[0] == player_team && board[6] == player_team
      board[3] = compy_team
      return board
  end
  if board[1] == player_team && board[7] == player_team
      board[4] = compy_team
      return board
  end
  if board[2] == player_team && board[8] == player_team
      board[5] = compy_team
      return board
  end
  if board[0] == player_team && board[8] == player_team
      board[4] = compy_team
      return board
  end
  if board[2] == player_team && board[6] == player_team
      board[4] = compy_team
      return board
  end
  
  return board
end

#################################################################
# 012
# 345
# 678

def calculate_defensive_move(board, compy_team, player_team)
  if board[4] == 5
    board[4] = compy_team
    return board
  end
  
  random_space = rand(8)
  if board[random_space] == random_space + 1
    board[random_space] = random_space + 1
    return board
  else
    calculate_defensive_move board
  end
end


#################################################################
# 012
# 345
# 678

def calculate_offensive_move board, compy_team, player_team
  random_corner = 0
  random_number = rand(3)
  if random_number == 0 && board[0] == 1
    random_corner = 0
  end
  if random_number == 1 && board[2] == 3
    random_corner = 2
  end
  if random_number == 2 && board[6] == 7
    random_corner = 6
  end
  if random_number == 3 && board[8] == 9
    random_corner = 8
  end
  board[random_corner] = compy_team
  return board
end
  
  
  
  